import 'package:flutter/material.dart';
import 'package:submission_flutter_pemula/model/results.dart';
import 'package:submission_flutter_pemula/repository/movie_db_repository.dart';
import 'package:submission_flutter_pemula/widget/image_online.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, this.results}) : super(key: key);

  final Results? results;

  @override
  Widget build(BuildContext context) {
    return DetailMobileView(
      results: results,
    );
  }
}

class DetailMobileView extends StatelessWidget {
  const DetailMobileView({Key? key, this.results}) : super(key: key);

  final Results? results;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 320,
              alignment: Alignment.center,
              child: Stack(
                children: [
                  ImageOnline(
                    url: "$miniImage${results?.backdropPath}",
                    height: 320,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Color(0x41020202),
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
                  Center(
                    child: ImageOnline(
                      url: "$miniImage${results?.posterPath}",
                      width: 90,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "${results?.title}",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
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
