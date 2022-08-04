class GeneralState<T>{
  T? success;
  Error? error;
  bool? isLoading;

  GeneralState({this.success, this.error,this.isLoading});
}