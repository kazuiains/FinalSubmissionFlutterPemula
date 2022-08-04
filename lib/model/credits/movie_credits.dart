

import 'package:submission_flutter_pemula/model/credits/cast.dart';
import 'package:submission_flutter_pemula/model/credits/crew.dart';

class MovieCredits {
  MovieCredits({
    int? id,
    List<Cast>? cast,
    List<Crew>? crew,
  }) {
    _id = id;
    _cast = cast;
    _crew = crew;
  }

  MovieCredits.fromJson(dynamic json) {
    _id = json['id'];
    if (json['cast'] != null) {
      _cast = [];
      json['cast'].forEach((v) {
        _cast?.add(Cast.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      _crew = [];
      json['crew'].forEach((v) {
        _crew?.add(Crew.fromJson(v));
      });
    }
  }

  int? _id;
  List<Cast>? _cast;
  List<Crew>? _crew;

  int? get id => _id;

  List<Cast>? get cast => _cast;

  List<Crew>? get crew => _crew;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_cast != null) {
      map['cast'] = _cast?.map((v) => v.toJson()).toList();
    }
    if (_crew != null) {
      map['crew'] = _crew?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
