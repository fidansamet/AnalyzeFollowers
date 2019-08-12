class AuthInfos {
  String token;

  AuthInfos(this.token);

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["token"] = token;

    return map;
  }

  factory AuthInfos.fromJson(Map<String, dynamic> json) {
    return AuthInfos(
      json['token'].toString(),
    );
  }
}
