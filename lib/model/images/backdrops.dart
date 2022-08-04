class Backdrops {
  Backdrops({
      double? aspectRatio, 
      String? filePath, 
      int? height, 
      dynamic iso6391, 
      int? voteAverage, 
      int? voteCount, 
      int? width,}){
    _aspectRatio = aspectRatio;
    _filePath = filePath;
    _height = height;
    _iso6391 = iso6391;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
    _width = width;
}

  Backdrops.fromJson(dynamic json) {
    _aspectRatio = json['aspect_ratio'];
    _filePath = json['file_path'];
    _height = json['height'];
    _iso6391 = json['iso_639_1'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
    _width = json['width'];
  }
  double? _aspectRatio;
  String? _filePath;
  int? _height;
  dynamic _iso6391;
  int? _voteAverage;
  int? _voteCount;
  int? _width;

  double? get aspectRatio => _aspectRatio;
  String? get filePath => _filePath;
  int? get height => _height;
  dynamic get iso6391 => _iso6391;
  int? get voteAverage => _voteAverage;
  int? get voteCount => _voteCount;
  int? get width => _width;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['aspect_ratio'] = _aspectRatio;
    map['file_path'] = _filePath;
    map['height'] = _height;
    map['iso_639_1'] = _iso6391;
    map['vote_average'] = _voteAverage;
    map['vote_count'] = _voteCount;
    map['width'] = _width;
    return map;
  }

}