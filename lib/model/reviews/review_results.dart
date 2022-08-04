import 'author_details.dart';

class Results {
  Results({
      String? author, 
      AuthorDetails? authorDetails, 
      String? content, 
      String? createdAt, 
      String? id, 
      String? updatedAt, 
      String? url,}){
    _author = author;
    _authorDetails = authorDetails;
    _content = content;
    _createdAt = createdAt;
    _id = id;
    _updatedAt = updatedAt;
    _url = url;
}

  Results.fromJson(dynamic json) {
    _author = json['author'];
    _authorDetails = json['author_details'] != null ? AuthorDetails.fromJson(json['author_details']) : null;
    _content = json['content'];
    _createdAt = json['created_at'];
    _id = json['id'];
    _updatedAt = json['updated_at'];
    _url = json['url'];
  }
  String? _author;
  AuthorDetails? _authorDetails;
  String? _content;
  String? _createdAt;
  String? _id;
  String? _updatedAt;
  String? _url;

  String? get author => _author;
  AuthorDetails? get authorDetails => _authorDetails;
  String? get content => _content;
  String? get createdAt => _createdAt;
  String? get id => _id;
  String? get updatedAt => _updatedAt;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['author'] = _author;
    if (_authorDetails != null) {
      map['author_details'] = _authorDetails?.toJson();
    }
    map['content'] = _content;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    map['updated_at'] = _updatedAt;
    map['url'] = _url;
    return map;
  }

}