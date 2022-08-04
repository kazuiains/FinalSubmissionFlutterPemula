class AuthorDetails {
  AuthorDetails({
      String? name, 
      String? username, 
      String? avatarPath, 
      dynamic rating,}){
    _name = name;
    _username = username;
    _avatarPath = avatarPath;
    _rating = rating;
}

  AuthorDetails.fromJson(dynamic json) {
    _name = json['name'];
    _username = json['username'];
    _avatarPath = json['avatar_path'];
    _rating = json['rating'];
  }
  String? _name;
  String? _username;
  String? _avatarPath;
  dynamic _rating;

  String? get name => _name;
  String? get username => _username;
  String? get avatarPath => _avatarPath;
  dynamic get rating => _rating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['username'] = _username;
    map['avatar_path'] = _avatarPath;
    map['rating'] = _rating;
    return map;
  }

}