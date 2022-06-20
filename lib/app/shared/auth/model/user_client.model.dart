class UserClientModel {
  String name;
  String email;
  String password;

  UserClientModel({
    this.name = '',
    this.email = '',
    this.password = '',
  });

  factory UserClientModel.fromDocument(doc) {
    return UserClientModel(
      name: doc['name'],
      email: doc['email'],
      password: doc['password'],
    );
  }

  factory UserClientModel.fromJson(Map<String, dynamic> json) {
    return UserClientModel(
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
