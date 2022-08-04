import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:submission_flutter_pemula/config/dio_config.dart';
import 'package:submission_flutter_pemula/model/list/list_movie.dart';
import 'package:submission_flutter_pemula/model/list/list_results.dart';
import 'package:submission_flutter_pemula/repository/endpoint_movie_db.dart';
import 'package:submission_flutter_pemula/repository/parameter_key_request.dart';
import 'package:submission_flutter_pemula/screen/detail_screen.dart';
import 'package:submission_flutter_pemula/screen/developer_screen.dart';
import 'package:submission_flutter_pemula/widget/image_online.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;
  ListMovie? _popularList;
  ListMovie? _topRatedList;
  ListMovie? _nowPlayingList;
  ListMovie? _upcomingList;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    Response? popularResp;
    Response? topRatedResp;
    Response? nowPlayingResp;
    Response? upcomingResp;
    try {
      popularResp = await movieDbDio.get(popular, queryParameters: {pApiKey: apiKey, pLanguage: defaultLanguage, pPage: defaultPage});
      topRatedResp = await movieDbDio.get(topRated, queryParameters: {pApiKey: apiKey, pLanguage: defaultLanguage, pPage: defaultPage});
      nowPlayingResp = await movieDbDio.get(nowPlaying, queryParameters: {pApiKey: apiKey, pLanguage: defaultLanguage, pPage: defaultPage});
      upcomingResp = await movieDbDio.get(upcoming, queryParameters: {pApiKey: apiKey, pLanguage: defaultLanguage, pPage: defaultPage});
    } catch (error) {
      _isLoading = false;
      print('there is an error: $error');
    } finally {
      setState(() {
        _isLoading = false;

        _popularList = ListMovie.fromJson(popularResp?.data!);
        _topRatedList = ListMovie.fromJson(topRatedResp?.data!);
        _nowPlayingList = ListMovie.fromJson(nowPlayingResp?.data!);
        _upcomingList = ListMovie.fromJson(upcomingResp?.data!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Movie List"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (_isLoading) ...[
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
                    ),
                  ),
                )
              ] else ...[
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return DeveloperScreen();
                      },
                    ));
                  },
                  child: Image.asset("images/background_3.jpg"),
                ),
                MovieDbGridView(listTitle: "Popular", listData: _popularList),
                MovieDbGridView(listTitle: "Top Rated", listData: _topRatedList),
                MovieDbGridView(listTitle: "Now Playing", listData: _nowPlayingList),
                MovieDbGridView(listTitle: "Upcoming", listData: _upcomingList),
              ],
            ],
          ),
        ));
  }
}

class MovieDbGridView extends StatefulWidget {
  final String listTitle;
  final ListMovie? listData;

  const MovieDbGridView({Key? key, required this.listTitle, this.listData}) : super(key: key);

  @override
  State<MovieDbGridView> createState() => _MovieDbGridViewState();
}

class _MovieDbGridViewState extends State<MovieDbGridView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
      height: 180,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                widget.listTitle,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
              itemBuilder: (context, index) {
                final Results? data = widget.listData?.results![index];

                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return DetailScreen(
                          results: data,
                        );
                      },
                    ));
                  },
                  child: Card(
                    child: SizedBox(
                      width: 160,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: ImageOnline(
                                      url: "$miniImage${data?.backdropPath}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Card(
                                    elevation: 0.0,
                                    color: const Color.fromRGBO(68, 138, 255, 50),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        "${data?.voteAverage!}",
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(4.0, 0, 4.0, 0),
                                child: Text(
                                  "${data?.title!}",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: widget.listData?.results?.length,
            ),
          ),
        ],
      ),
    );
  }
}
