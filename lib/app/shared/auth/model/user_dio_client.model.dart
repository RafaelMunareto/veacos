class UserClientModel {
  dynamic name;
  dynamic email;
  dynamic password;

  UserClientModel({
    this.name,
    this.email,
    this.password,
  });

  factory UserClientModel.fromDocument(doc) {
    return UserClientModel(
      name: doc['name'],
      email: doc['email'],
      password: doc['password'],
    );
  }

  factory UserClientModel.fromMap(Map<String, dynamic> map) {
    return UserClientModel(
      name: map["name"],
      email: map["email"],
      password: map["password"],
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
