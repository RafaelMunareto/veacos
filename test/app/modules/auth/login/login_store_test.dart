import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:veacos/app/shared/auth/model/user_model.dart';
import 'package:veacos/app/shared/utils/dio_struture.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:veacos/app/shared/utils/error_model.dart';

void main() {
  final dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);
  dio.httpClientAdapter = dioAdapter;
  var baseUrl = DioStruture().baseUrl;

  test('login success', () {
    var email$ = ValueNotifier<String>('rafael.munareto@caixa.gov.br ');
    var email = email$.value.trim().toLowerCase();
    var password$ = ValueNotifier("102030");
    UserModel user = UserModel();

    expect(email, allOf([isA<String>(), contains("@")]));
    expect(password$.value, allOf([isA<String>(), equals("102030")]));

    dioAdapter.onPost(
        baseUrl + 'users/signin',
        data: {"email": email$, "password": password$.value},
        (request) =>
            request.reply(200, user = UserModel.fromJson(jsonResponse)));

    expect(user.name, allOf([isA<String>(), equals("Rafael")]));
  });

  test('login error', () {
    var email$ = ValueNotifier<String>('rafael.munareto@caixa.gov.br ');
    var password$ = ValueNotifier("102030");
    var msg$ = ValueNotifier('');

    dioAdapter.onPost(
        baseUrl + 'users/signin',
        data: {"email": email$.value, "password": password$.value},
        (request) => request.reply(
            404,
            msg$.value =
                ErrorModel.fromJson(jsonResponseErroControlado).message));

    expect(msg$.value, allOf([isA<String>(), equals("Senha inválida.")]));

    msg$.value = jsonDecode(erroBanco)['message'];
    expect(msg$.value, allOf([isA<String>(), contains("Connection refused ")]));
  });
}

const jsonResponse =
    '{"id":"62b4c7a8d3608a18a9cbe079","name":"Rafael","jwtToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MmI0YzdhOGQzNjA4YTE4YTljYmUwNzkiLCJpYXQiOjE2NTg4NDMxNjQsImV4cCI6MTY1ODkyOTU2NH0.jiKSUnhQ_2TOJ5mQebDHet-6Ctl9erjiB85Uxwj9Vbo","email":"rafaelmmunareto@gmail.com"}';

const jsonResponseErroControlado =
    '{"statusCode":404,"message":"Senha inválida.","error":"Not Found"}';

const erroBanco =
    '{"response": null, "message": "SocketException: Connection refused (OS Error: Connection refused, errno = 111), address = 10.0.2.2, port = 38738"}';
