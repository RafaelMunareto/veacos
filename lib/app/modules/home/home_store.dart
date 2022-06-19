import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:veacos/app/modules/home/shared/controller/client_store.dart';
import 'package:veacos/app/shared/auth/auth_controller.dart';
import 'package:veacos/app/shared/repositories/localstorage/local_storage_interface.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  ClientStore client = Modular.get();
  AuthController auth = Modular.get();
  final ILocalStorage storage = Modular.get();

  HomeStoreBase() {
    client.buscaTheme();
  }

  changeSwitch(value) {
    value = value ? ['dark'] : ['light'];
    storage.put('theme', value);
  }
}
