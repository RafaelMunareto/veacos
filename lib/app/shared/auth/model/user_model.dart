import 'dart:convert';

class UserModel {
  String id;
  String name;
  String jwtToken;
  String email;
  UserModel({
    this.id = '',
    this.name = '',
    this.jwtToken = '',
    this.email = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'jwtToken': jwtToken,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      jwtToken: map['jwtToken'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
