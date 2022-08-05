import 'package:submission_flutter_pemula/model/list/list_movie.dart';
import 'package:submission_flutter_pemula/network/data_result.dart';
import 'package:submission_flutter_pemula/network/general_state.dart';
import 'package:submission_flutter_pemula/repository/endpoint_movie_db.dart';
import 'package:submission_flutter_pemula/repository/movie_repository.dart';

class HomeViewModel {
  final MovieRepository repository = MovieRepository();

  Future<GeneralState<HomeData>> init() async {
    DataResult<ListMovie>? popularData = await repository.getListMovie(popular);
    DataResult<ListMovie>? topRelatedData =
        await repository.getListMovie(topRated);
    DataResult<ListMovie>? nowPlayingData =
        await repository.getListMovie(nowPlaying);
    DataResult<ListMovie>? upcomingData =
        await repository.getListMovie(upcoming);

    if (popularData.onError != null &&
        topRelatedData.onError != null &&
        nowPlayingData.onError != null &&
        upcomingData.onError != null) {
      return GeneralState(success: null, error: popularData.onError);
    }
    return GeneralState(
        success: HomeData(
            popularData: popularData,
            topRelatedData: topRelatedData,
            nowPlayingData: nowPlayingData,
            upcomingData: upcomingData),
        error: null);
  }
}

class HomeData {
  DataResult<ListMovie>? popularData;
  DataResult<ListMovie>? topRelatedData;
  DataResult<ListMovie>? nowPlayingData;
  DataResult<ListMovie>? upcomingData;

  HomeData(
      {this.popularData,
      this.topRelatedData,
      this.nowPlayingData,
      this.upcomingData});
}
