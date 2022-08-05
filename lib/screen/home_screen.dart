import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:submission_flutter_pemula/config/dio_config.dart';
import 'package:submission_flutter_pemula/model/list/list_movie.dart';
import 'package:submission_flutter_pemula/model/list/list_results.dart';
import 'package:submission_flutter_pemula/network/general_state.dart';
import 'package:submission_flutter_pemula/repository/endpoint_movie_db.dart';
import 'package:submission_flutter_pemula/repository/parameter_key_request.dart';
import 'package:submission_flutter_pemula/screen/detail_screen.dart';
import 'package:submission_flutter_pemula/screen/developer_screen.dart';
import 'package:submission_flutter_pemula/viewmodel/home_viewmodel.dart';
import 'package:submission_flutter_pemula/widget/image_online.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Movie List"),
        ),
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FutureBuilder<GeneralState<HomeData>>(
                  future: _viewModel.init(),
                  builder: (context, snapshot) {
                    print("connection state: ${snapshot.connectionState}");
                    print("has error: ${snapshot.hasError}");
                    print("has data: ${snapshot.hasData}");
                    if (snapshot.connectionState != ConnectionState.done) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.lightBlueAccent),
                          ),
                        ),
                      );
                    } else if (snapshot.hasData) {
                      if (snapshot.data!.error != null) {
                        return Text("error");
                      } else {
                        return Column(
                          children: [
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
                            MovieDbGridView(
                                listTitle: "Popular",
                                listData: snapshot
                                    .data!.success!.popularData!.onSuccess),
                            MovieDbGridView(
                                listTitle: "Top Rated",
                                listData: snapshot
                                    .data!.success!.topRelatedData!.onSuccess),
                            MovieDbGridView(
                                listTitle: "Now Playing",
                                listData: snapshot
                                    .data!.success!.nowPlayingData!.onSuccess),
                            MovieDbGridView(
                                listTitle: "Upcoming",
                                listData: snapshot
                                    .data!.success!.upcomingData!.onSuccess),
                          ],
                        );
                      }
                    } else if(snapshot.hasError){
                      return Text("error");
                    } else {
                      //no data
                      return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.lightBlueAccent),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> _refresh() async{
    setState(() {});
  }
}

class MovieDbGridView extends StatefulWidget {
  final String listTitle;
  final ListMovie? listData;

  const MovieDbGridView({Key? key, required this.listTitle, this.listData})
      : super(key: key);

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
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                                    color:
                                        const Color.fromRGBO(68, 138, 255, 50),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        "${data?.voteAverage!}",
                                        style: const TextStyle(
                                            color: Colors.white),
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
                                padding:
                                    const EdgeInsets.fromLTRB(4.0, 0, 4.0, 0),
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
