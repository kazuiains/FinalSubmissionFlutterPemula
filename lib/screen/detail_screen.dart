import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:submission_flutter_pemula/config/dio_config.dart';
import 'package:submission_flutter_pemula/model/detail/detail_movie.dart';
import 'package:submission_flutter_pemula/model/list/list_movie.dart';
import 'package:submission_flutter_pemula/model/list/list_results.dart';
import 'package:submission_flutter_pemula/model/credits/movie_credits.dart';
import 'package:submission_flutter_pemula/repository/endpoint_movie_db.dart';
import 'package:submission_flutter_pemula/repository/parameter_key_request.dart';
import 'package:submission_flutter_pemula/widget/image_online.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, this.results}) : super(key: key);

  final Results? results;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _isLoading = true;
  DetailMovie? _detailMovie;
  MovieCredits? _credits;
  ListMovie? _similarList;

  @override
  void initState() {
    init();
  }

  void init() async {
    Response? detail;
    Response? credits;
    Response? similar;
    Response? images;
    Response? reviews;

    try {
      detail = await movieDbDio.get("${widget.results?.id}", queryParameters: {pApiKey: apiKey, pLanguage: defaultLanguage, pPage: defaultPage});
      credits = await movieDbDio
          .get("${widget.results?.id}$creditsDMovie", queryParameters: {pApiKey: apiKey, pLanguage: defaultLanguage, pPage: defaultPage});
      similar = await movieDbDio
          .get("${widget.results?.id}$similarDMovie", queryParameters: {pApiKey: apiKey, pLanguage: defaultLanguage, pPage: defaultPage});
      images = await movieDbDio
          .get("${widget.results?.id}$images", queryParameters: {pApiKey: apiKey, pLanguage: defaultLanguage});
      reviews = await movieDbDio
          .get("${widget.results?.id}$reviews", queryParameters: {pApiKey: apiKey, pLanguage: defaultLanguage, pPage: defaultPage});
    } catch (error) {
      _isLoading = false;
      print('there is an error: $error');
    } finally {
      setState(() {
        _isLoading = false;

        _detailMovie = DetailMovie.fromJson(detail?.data!);
        _credits = MovieCredits.fromJson(credits?.data!);
        _similarList = ListMovie.fromJson(similar?.data!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget result;
    if (_isLoading) {
      result = Scaffold(
        body: const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
          ),
        ),
      );
    } else {
      result = DetailMobileView(
        results: widget.results,
        detailMovie: _detailMovie,
        credits: _credits,
        similarList: _similarList,
      );
    }
    return result;
  }
}

class DetailMobileView extends StatefulWidget {
  const DetailMobileView({Key? key, this.results, this.detailMovie, this.credits, this.similarList}) : super(key: key);

  final Results? results;
  final DetailMovie? detailMovie;
  final MovieCredits? credits;
  final ListMovie? similarList;

  @override
  State<DetailMobileView> createState() => _DetailMobileViewState();
}

class _DetailMobileViewState extends State<DetailMobileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 450,
              alignment: Alignment.center,
              child: Stack(
                children: [
                  ImageOnline(
                    url: "$miniImage${widget.results?.posterPath}",
                    height: 450,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0x0), Color(0xFF000000)],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Column(
                        children: [
                          Text(
                            "${widget.results?.title}",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("1h 3mins"),
                          Chip(label: Text("Action"))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
