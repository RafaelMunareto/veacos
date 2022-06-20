class UserModel {
  String id;
  String name;
  String jwtToken;
  String email;

  UserModel(
      {this.id = '', this.name = '', this.jwtToken = '', this.email = ''});

  factory UserModel.fromDocument(doc) {
    return UserModel(
      id: doc['id'],
      name: doc['name'],
      jwtToken: doc['jwtToken'],
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['name'],
        jwtToken: json['jwtToken'],
        email: json['email']);
  }

  Map<String, dynamic> toJson() => {};
}
