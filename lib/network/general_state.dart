import 'data_result.dart';
class GeneralState<T>{
  T? success;
  Error? error;

  GeneralState({this.success, this.error});
}