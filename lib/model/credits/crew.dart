class Crew {
  Crew({
    bool? adult,
    int? gender,
    int? id,
    String? knownForDepartment,
    String? name,
    String? originalName,
    double? popularity,
    String? profilePath,
    String? creditId,
    String? department,
    String? job,
  }) {
    _adult = adult;
    _gender = gender;
    _id = id;
    _knownForDepartment = knownForDepartment;
    _name = name;
    _originalName = originalName;
    _popularity = popularity;
    _profilePath = profilePath;
    _creditId = creditId;
    _department = department;
    _job = job;
  }

  Crew.fromJson(dynamic json) {
    _adult = json['adult'];
    _gender = json['gender'];
    _id = json['id'];
    _knownForDepartment = json['known_for_department'];
    _name = json['name'];
    _originalName = json['original_name'];
    _popularity = json['popularity'];
    _profilePath = json['profile_path'];
    _creditId = json['credit_id'];
    _department = json['department'];
    _job = json['job'];
  }

  bool? _adult;
  int? _gender;
  int? _id;
  String? _knownForDepartment;
  String? _name;
  String? _originalName;
  double? _popularity;
  String? _profilePath;
  String? _creditId;
  String? _department;
  String? _job;

  bool? get adult => _adult;

  int? get gender => _gender;

  int? get id => _id;

  String? get knownForDepartment => _knownForDepartment;

  String? get name => _name;

  String? get originalName => _originalName;

  double? get popularity => _popularity;

  String? get profilePath => _profilePath;

  String? get creditId => _creditId;

  String? get department => _department;

  String? get job => _job;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = _adult;
    map['gender'] = _gender;
    map['id'] = _id;
    map['known_for_department'] = _knownForDepartment;
    map['name'] = _name;
    map['original_name'] = _originalName;
    map['popularity'] = _popularity;
    map['profile_path'] = _profilePath;
    map['credit_id'] = _creditId;
    map['department'] = _department;
    map['job'] = _job;
    return map;
  }
}
