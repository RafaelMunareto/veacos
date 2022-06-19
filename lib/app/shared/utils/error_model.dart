class ErrorModel {
  int? statusCode;
  String message;
  String error;

  ErrorModel({this.statusCode, this.message = '', this.error = ''});

  factory ErrorModel.fromDocument(doc) {
    return ErrorModel(
      statusCode: doc['statusCode'],
      message: doc['message'],
      error: doc['error'],
    );
  }

  factory ErrorModel.fromJson(json) {
    return ErrorModel(
      statusCode: json['statusCode'],
      message: json['message'],
      error: json['error'],
    );
  }

  Map<String, dynamic> toJson() => {};
}
