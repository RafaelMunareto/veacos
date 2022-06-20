import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:veacos/app/modules/settings/shared/model/settings_model.dart';
import 'package:veacos/app/shared/auth/model/user_model.dart';
import 'package:veacos/app/shared/repositories/localstorage/local_storage_interface.dart';

part 'client_settings_store.g.dart';

class ClientSettingsStore = _ClientSettingsStoreBase with _$ClientSettingsStore;

abstract class _ClientSettingsStoreBase with Store {
  ILocalStorage storage = Modular.get();

  @observable
  bool loading = true;

  @action
  setLoading(value) => loading = value;

  @observable
  bool loadingImagem = false;

  @action
  setLoadingImagem(value) => loadingImagem = value;

  @observable
  bool theme = false;

  @action
  setTheme(value) => theme = value;

  @action
  buscaTheme() {
    storage.get('theme').then((value) {
      if (value?[0] == 'dark') {
        setTheme(true);
      } else {
        setTheme(false);
      }
    });
  }

  @action
  getUid() {
    storage.get('user').then((value) {
      setUser(UserModel.fromJson(jsonDecode(value[0])));
    });
  }

  @observable
  UserModel user = UserModel();

  @action
  setUser(value) => user = value;

  @observable
  SettingsModel settings = SettingsModel();

  @action
  setSettings(value) => user = value;
}
