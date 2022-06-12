class UserModel {
  String name;
  String jwtToken;
  String email;

  UserModel({this.name = '', this.jwtToken = '', this.email = ''});

  factory UserModel.fromDocument(doc) {
    return UserModel(
      name: doc['name'],
      jwtToken: doc['jwtToken'],
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'], jwtToken: json['jwtToken'], email: json['email']);
  }

  Map<String, dynamic> toJson() => {};
}
