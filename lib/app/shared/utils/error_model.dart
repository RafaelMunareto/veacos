// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ErrorModel {
  int? statusCode;
  dynamic message;
  String error;

  ErrorModel({this.statusCode, this.message, this.error = ''});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'statusCode': statusCode,
      'message': message,
      'error': error,
    };
  }

  factory ErrorModel.fromMap(Map<String, dynamic> map) {
    return ErrorModel(
      statusCode: map['statusCode'] != null ? map['statusCode'] as int : null,
      message: map['message'] is List
          ? map['message'][0] as String
          : map['message'] as String,
      error: map['error'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ErrorModel.fromJson(String source) =>
      ErrorModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
