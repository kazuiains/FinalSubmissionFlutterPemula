import 'review_results.dart';

class MovieReview {
  MovieReview({
      int? id, 
      int? page, 
      List<Results>? results, 
      int? totalPages, 
      int? totalResults,}){
    _id = id;
    _page = page;
    _results = results;
    _totalPages = totalPages;
    _totalResults = totalResults;
}

  MovieReview.fromJson(dynamic json) {
    _id = json['id'];
    _page = json['page'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(Results.fromJson(v));
      });
    }
    _totalPages = json['total_pages'];
    _totalResults = json['total_results'];
  }
  int? _id;
  int? _page;
  List<Results>? _results;
  int? _totalPages;
  int? _totalResults;

  int? get id => _id;
  int? get page => _page;
  List<Results>? get results => _results;
  int? get totalPages => _totalPages;
  int? get totalResults => _totalResults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['page'] = _page;
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = _totalPages;
    map['total_results'] = _totalResults;
    return map;
  }

}