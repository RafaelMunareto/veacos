// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_null_in_if_null_operators
import 'dart:convert';

class ErrorModel {
  int? statusCode;
  dynamic message;
  dynamic error;

  ErrorModel({this.statusCode, this.message, this.error});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (statusCode != null) {
      result.addAll({'statusCode': statusCode});
    }
    result.addAll({'message': message});
    result.addAll({'error': error});

    return result;
  }

  factory ErrorModel.fromMap(Map<String, dynamic> map) {
    return ErrorModel(
      statusCode: map['statusCode']?.toInt(),
      message:
          map['message'] is List ? map['message'][0] : map['message'] ?? null,
      error: map['error'] ?? null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ErrorModel.fromJson(String source) =>
      ErrorModel.fromMap(json.decode(source));
}
