import 'dart:convert';

class UserClientModel {
  String name;
  String email;
  String password;

  UserClientModel({
    this.name = '',
    this.email = '',
    this.password = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory UserClientModel.fromMap(Map<String, dynamic> map) {
    return UserClientModel(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserClientModel.fromJson(String source) =>
      UserClientModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
