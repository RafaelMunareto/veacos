import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:veacos/app/modules/settings/shared/model/settings_model.dart';
import 'package:veacos/app/shared/utils/dio_struture.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:veacos/app/shared/utils/error_model.dart';

void main() {
  final dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);
  dio.httpClientAdapter = dioAdapter;
  var baseUrl = DioStruture().baseUrl;

  test('settings index success repository', () {
    List<SettingsModel> settings = [];
    dioAdapter.onGet(
        baseUrl + 'settings',
        (request) => request.reply(
            200,
            settings = (jsonDecode(jsonResponseIndex) as List)
                .map((e) => SettingsModel.fromMap(e))
                .toList()));

    expect(settings.first.id, equals("62e1715122fb7b08ee923a22"));
  });

  test('settings index error repository', () {
    var msg$ = ValueNotifier('');
    dioAdapter.onPost(
        baseUrl + 'settings',
        (request) => request.reply(
            401,
            msg$.value =
                ErrorModel.fromJson(jsonResponseErroControlado).message));

    expect(msg$.value, allOf([isA<String>(), equals("Unauthorized")]));

    msg$.value = jsonDecode(erroBanco)['message'];
    expect(msg$.value, allOf([isA<String>(), contains("Connection refused ")]));
  });
}

const jsonResponseIndex =
    '[{"_id":"62e1715122fb7b08ee923a22","foto":"Captura de tela de 2022-07-10 11-17-35.png","grupo":{"_id":"62e170b522fb7b08ee9239f4","grupo":"teste","__v":0},"user":{"_id":"62b4c7a8d3608a18a9cbe079","name":"Rafael","email":"rafaelmmunareto@gmail.com","password":"tM8M6Bwj0V/tnaYaupkZkHWeceXLP0K","__v":0},"__v":0}]';

const jsonResponseErroControlado =
    '{"statusCode":401,"message":"Unauthorized"}';

const erroBanco =
    '{"response": null, "message": "SocketException: Connection refused (OS Error: Connection refused, errno = 111), address = 10.0.2.2, port = 38738"}';
