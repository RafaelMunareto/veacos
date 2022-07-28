import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:veacos/app/modules/settings/shared/controller/client_settings_store.dart';
import 'package:veacos/app/modules/settings/shared/services/interfaces/settings_service_interfaces.dart';
import 'package:veacos/app/shared/repositories/localstorage/local_storage_interface.dart';
import 'package:veacos/app/shared/utils/dio_struture.dart';
import 'package:veacos/app/shared/utils/error_model.dart';

class SettingsStore {
  final ISettingsService settingsService;
  final ClientSettingsStore client = Modular.get();
  final ILocalStorage storage = Modular.get();
  final ImagePicker picker = ImagePicker();

  SettingsStore({required this.settingsService}) {
    getList();
  }

  getList() async {
    await client.getUid();
    await client.buscaTheme();
    await getSetting();
  }

  getSetting() async {
    await client.setLoadingImagem(true);
    await settingsService.show(client.user$.value.id).then((value) {
      client.setSetting(value);
    }).catchError((erro) {
      client.setError(ErrorModel.fromJson(erro));
    }).whenComplete(() => client.setLoadingImagem(false));
  }

  store() async {
    await settingsService.store(client.setting$.value);
  }

  Future atualizaImagem({CroppedFile? image, File? imageDesktop}) async {
    client.setLoadingImagem(true);
    dynamic listData;
    FormData formData = FormData.fromMap(
      {
        "urlImage": MultipartFile.fromBytes(listData,
            filename:
                client.setting$.value.foto == DioStruture().baseUrl + 'files'
                    ? client.setting$.value.id
                    : client.setting$.value.foto),
      },
    );
    try {
      Response response;
      var dio = await DioStruture().dioAction();
      response =
          await dio.put('perfil/${client.setting$.value.id}', data: formData);
      DioStruture().statusRequest(response);
      getSetting();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
