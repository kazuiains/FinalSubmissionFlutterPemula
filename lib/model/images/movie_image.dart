import 'backdrops.dart';
import 'posters.dart';

class MovieImage {
  MovieImage({
      int? id, 
      List<Backdrops>? backdrops, 
      List<Posters>? posters,}){
    _id = id;
    _backdrops = backdrops;
    _posters = posters;
}

  MovieImage.fromJson(dynamic json) {
    _id = json['id'];
    if (json['backdrops'] != null) {
      _backdrops = [];
      json['backdrops'].forEach((v) {
        _backdrops?.add(Backdrops.fromJson(v));
      });
    }
    if (json['posters'] != null) {
      _posters = [];
      json['posters'].forEach((v) {
        _posters?.add(Posters.fromJson(v));
      });
    }
  }
  int? _id;
  List<Backdrops>? _backdrops;
  List<Posters>? _posters;

  int? get id => _id;
  List<Backdrops>? get backdrops => _backdrops;
  List<Posters>? get posters => _posters;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_backdrops != null) {
      map['backdrops'] = _backdrops?.map((v) => v.toJson()).toList();
    }
    if (_posters != null) {
      map['posters'] = _posters?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}