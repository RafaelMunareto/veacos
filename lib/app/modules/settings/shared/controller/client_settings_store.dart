import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:veacos/app/modules/settings/shared/model/settings_model.dart';
import 'package:veacos/app/shared/auth/model/user_model.dart';
import 'package:veacos/app/shared/repositories/localstorage/local_storage_interface.dart';

class ClientSettingsStore {
  ILocalStorage storage = Modular.get();

  var loadingImagem$ = ValueNotifier(false);
  setLoadingImagem(value) => loadingImagem$.value = value;

  var theme$ = ValueNotifier(false);
  setTheme(value) => theme$.value = value;

  var loading$ = ValueNotifier(false);
  setLoading(value) => loading$.value = value;

  var settings$ = ValueNotifier([]);
  setSettings(value) => settings$.value = value;

  var setting$ = ValueNotifier<SettingsModel>(SettingsModel());
  setSetting(value) => setting$.value = value;

  var error$ = ValueNotifier('');
  setError(value) => error$.value = value;

  buscaTheme() {
    storage.get('theme').then((value) {
      if (value?[0] == 'dark') {
        setTheme(true);
      } else {
        setTheme(false);
      }
    });
  }

  getUid() {
    storage.get('user').then((value) {
      setUser(UserModel.fromMap(jsonDecode(value[0])));
    });
  }

  var user$ = ValueNotifier(UserModel());
  setUser(value) => user$.value = value;
}
