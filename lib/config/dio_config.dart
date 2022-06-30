import 'package:dio/dio.dart';
import 'package:submission_flutter_pemula/repository/movie_db_repository.dart';

BaseOptions movieDbOptionDio = BaseOptions(
  baseUrl: baseUrl,
  connectTimeout: 3000,
  receiveTimeout: 3000,
);

Dio movieDbDio = Dio(movieDbOptionDio);