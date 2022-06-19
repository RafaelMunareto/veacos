class UserClientModel {
  String id;
  String name;
  String email;
  String password;

  UserClientModel({
    this.id = '',
    this.name = '',
    this.email = '',
    this.password = '',
  });

  factory UserClientModel.fromDocument(doc) {
    return UserClientModel(
      id: doc['id'],
      name: doc['name'],
      email: doc['email'],
      password: doc['password'],
    );
  }

  factory UserClientModel.fromMap(Map<String, dynamic> map) {
    return UserClientModel(
      id: map["id"],
      name: map["name"],
      email: map["email"],
      password: map["password"],
    );
  }

  factory UserClientModel.fromJson(Map<String, dynamic> json) {
    return UserClientModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
      };
}
