import 'package:dio/dio.dart';
import 'package:submission_flutter_pemula/config/dio_config.dart';
import 'package:submission_flutter_pemula/model/credits/movie_credits.dart';
import 'package:submission_flutter_pemula/model/detail/detail_movie.dart';
import 'package:submission_flutter_pemula/model/images/movie_image.dart';
import 'package:submission_flutter_pemula/model/list/list_movie.dart';
import 'package:submission_flutter_pemula/model/reviews/movie_review.dart';
import 'package:submission_flutter_pemula/network/data_result.dart';
import 'package:submission_flutter_pemula/repository/endpoint_movie_db.dart';
import 'package:submission_flutter_pemula/repository/parameter_key_request.dart';

class MovieRepository {
  Future<DataResult<ListMovie>> getListMovie(String typeList) async {
    Response? response;
    response = await movieDbDio.get(typeList, queryParameters: {
      pApiKey: apiKey,
      pLanguage: defaultLanguage,
      pPage: defaultPage
    });

    try {
      if (response.statusCode == 200) {
        print("Response: Success");
        return DataResult(
            onSuccess: ListMovie.fromJson(response.data!), onError: null);
      } else {
        print("Response: Failed");
        return DataResult(
            onSuccess: null,
            onError: Error(
                message: "${response.data}",
                statusCode: "${response.statusCode}",
                reasonPhrase: "${response.statusMessage}"));
      }
    } catch (e) {
      print("Error: $e");
      return DataResult(
          onSuccess: null,
          onError: Error(
              message: e.toString(),
              statusCode: "000",
              reasonPhrase: e.toString()));
    }
  }

  Future<DataResult<DetailMovie>> getDetailMovie(String movieId) async {
    Response? response;
    response = await movieDbDio.get(movieId,
        queryParameters: {pApiKey: apiKey, pLanguage: defaultLanguage});

    try {
      if (response.statusCode == 200) {
        print("Response: Success");
        return DataResult(
            onSuccess: DetailMovie.fromJson(response.data!), onError: null);
      } else {
        print("Response: Failed");
        return DataResult(
            onSuccess: null,
            onError: Error(
                message: "${response.data}",
                statusCode: "${response.statusCode}",
                reasonPhrase: "${response.statusMessage}"));
      }
    } catch (e) {
      print("Error: $e");
      return DataResult(
          onSuccess: null,
          onError: Error(
              message: e.toString(),
              statusCode: "000",
              reasonPhrase: e.toString()));
    }
  }

  Future<DataResult<MovieCredits>> getMovieCredits(String movieId) async {
    Response? response;
    response = await movieDbDio.get("$movieId$creditsDMovie",
        queryParameters: {pApiKey: apiKey, pLanguage: defaultLanguage});

    try {
      if (response.statusCode == 200) {
        print("Response: Success");
        return DataResult(
            onSuccess: MovieCredits.fromJson(response.data!), onError: null);
      } else {
        print("Response: Failed");
        return DataResult(
            onSuccess: null,
            onError: Error(
                message: "${response.data}",
                statusCode: "${response.statusCode}",
                reasonPhrase: "${response.statusMessage}"));
      }
    } catch (e) {
      print("Error: $e");
      return DataResult(
          onSuccess: null,
          onError: Error(
              message: e.toString(),
              statusCode: "000",
              reasonPhrase: e.toString()));
    }
  }

  Future<DataResult<MovieImage>> getMovieImages(String movieId) async {
    Response? response;
    response = await movieDbDio.get("$movieId$imagesDMovie",
        queryParameters: {pApiKey: apiKey, pLanguage: defaultLanguage});

    try {
      if (response.statusCode == 200) {
        print("Response: Success");
        return DataResult(
            onSuccess: MovieImage.fromJson(response.data!), onError: null);
      } else {
        print("Response: Failed");
        return DataResult(
            onSuccess: null,
            onError: Error(
                message: "${response.data}",
                statusCode: "${response.statusCode}",
                reasonPhrase: "${response.statusMessage}"));
      }
    } catch (e) {
      print("Error: $e");
      return DataResult(
          onSuccess: null,
          onError: Error(
              message: e.toString(),
              statusCode: "000",
              reasonPhrase: e.toString()));
    }
  }

  Future<DataResult<MovieReview>> getMovieReviews(String movieId) async {
    Response? response;
    response = await movieDbDio.get("$movieId$reviewsDMovie",
        queryParameters: {pApiKey: apiKey, pLanguage: defaultLanguage});

    try {
      if (response.statusCode == 200) {
        print("Response: Success");
        return DataResult(
            onSuccess: MovieReview.fromJson(response.data!), onError: null);
      } else {
        print("Response: Failed");
        return DataResult(
            onSuccess: null,
            onError: Error(
                message: "${response.data}",
                statusCode: "${response.statusCode}",
                reasonPhrase: "${response.statusMessage}"));
      }
    } catch (e) {
      print("Error: $e");
      return DataResult(
          onSuccess: null,
          onError: Error(
              message: e.toString(),
              statusCode: "000",
              reasonPhrase: e.toString()));
    }
  }
}
