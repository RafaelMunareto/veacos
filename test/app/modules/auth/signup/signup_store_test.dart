import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:veacos/app/shared/auth/model/user_client.model.dart';
import 'package:veacos/app/shared/utils/dio_struture.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:veacos/app/shared/utils/error_model.dart';

void main() {
  final dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);
  dio.httpClientAdapter = dioAdapter;
  var baseUrl = DioStruture().baseUrl;

  test('signup success', () {
    var email$ = ValueNotifier<String>('rafael.munareto@caixa.gov.br ');
    var name$ = ValueNotifier<String>('Rafael');
    var email = email$.value.trim().toLowerCase();
    var password$ = ValueNotifier("102030");
    UserClientModel user = UserClientModel();

    expect(email, allOf([isA<String>(), contains("@")]));
    expect(password$.value, allOf([isA<String>(), equals("102030")]));
    expect(name$.value, allOf([isA<String>(), equals("Rafael")]));

    UserClientModel model = UserClientModel(
        email: email, name: name$.value, password: password$.value);

    dioAdapter.onPost(
        baseUrl + '/users/signup',
        data: model.toJson(),
        (request) =>
            request.reply(200, user = UserClientModel.fromJson(jsonResponse)));

    expect(user.name, allOf([isA<String>(), contains("Rafael")]));
  });

  test('signup error', () {
    var email$ = ValueNotifier<String>('rafael.munareto@caixa.gov.br ');
    var name$ = ValueNotifier<String>('Rafael');
    var email = email$.value.trim().toLowerCase();
    var password$ = ValueNotifier("102030");
    var msg$ = ValueNotifier('');
    UserClientModel model = UserClientModel(
        email: email, name: name$.value, password: password$.value);

    dioAdapter.onPost(
        baseUrl + '/users/signup',
        data: model.toJson(),
        (request) => request.reply(
            400,
            msg$.value =
                ErrorModel.fromJson(jsonResponseErroControlado).message));

    expect(msg$.value, equals("email must be an email"));

    msg$.value = jsonDecode(erroBanco)['message'];
    expect(msg$.value, allOf([isA<String>(), contains("Connection refused ")]));
  });
}

const jsonResponse =
    '{"name":"Rafael icloud","email":"rafael.munareto@icloud.com","password":"m6ui4ai5HVduQKY3BHoZxuugxllc4iUSri","_id":"62e01592fb4564acf9eca71e","__v":0}';

const jsonResponseErroControlado =
    '{"statusCode":400,"message":["email must be an email"],"error":"Bad Request"}';

const erroBanco =
    '{"response": null, "message": "SocketException: Connection refused (OS Error: Connection refused, errno = 111), address = 10.0.2.2, port = 38738"}';
