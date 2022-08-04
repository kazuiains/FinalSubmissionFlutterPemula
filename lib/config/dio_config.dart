import 'package:dio/dio.dart';
import 'package:submission_flutter_pemula/repository/endpoint_movie_db.dart';

BaseOptions movieDbOptionDio = BaseOptions(
  baseUrl: baseUrl,
  connectTimeout: 3000,
  receiveTimeout: 3000,
);

Dio movieDbDio = Dio(movieDbOptionDio);