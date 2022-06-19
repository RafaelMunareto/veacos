import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:universal_html/html.dart';
import 'package:veacos/app/modules/settings/shared/controller/client_settings_store.dart';
import 'package:veacos/app/modules/settings/shared/services/interfaces/settings_service_interfaces.dart';
import 'package:veacos/app/shared/auth/model/user_client.model.dart';
import 'package:veacos/app/shared/repositories/localstorage/local_storage_interface.dart';
import 'package:veacos/app/shared/utils/dio_struture.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStoreBase with _$SettingsStore;

abstract class _SettingsStoreBase with Store {
  final ISettingsService settingsService;
  final ClientSettingsStore client = Modular.get();
  final ILocalStorage storage = Modular.get();
  final ImagePicker picker = ImagePicker();

  _SettingsStoreBase({required this.settingsService}) {
    getList();
  }

  getList() async {
    await client.buscaTheme();
    await getUid();
    await getSettings();
  }

  getUid() {
    storage.get('userDio').then((value) {
      client.setUser(UserClientModel.fromJson(jsonDecode(value[0])));
    });
  }

  getSettings() {
    settingsService.show(client.user.id).then((value) async {
      await client.setSettings(value);
    }).whenComplete(() {
      client.setLoading(false);
      client.setLoadingImagem(false);
    });
  }

  store() async {
    await settingsService.store(client.settings);
    getSettings();
  }

  Future atualizaImagem({CroppedFile? image, File? imageDesktop}) async {
    client.setLoadingImagem(true);
    dynamic listData;
    FormData formData = FormData.fromMap(
      {
        "urlImage": MultipartFile.fromBytes(listData,
            filename: client.settings.urlImage ==
                    DioStruture().baseUrlMunatasks + 'files'
                ? client.settings.id
                : client.settings.urlImage),
      },
    );
    try {
      Response response;
      var dio = await DioStruture().dioAction();
      response = await dio.put('perfil/${client.settings.id}', data: formData);
      DioStruture().statusRequest(response);
      getSettings();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
