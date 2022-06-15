import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:mobx/mobx.dart';
import 'package:veacos/app/modules/home/shared/controller/client_store.dart';
import 'package:veacos/app/shared/auth/auth_controller.dart';
import 'package:veacos/app/shared/repositories/localstorage/local_storage_interface.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  ClientStore client = Modular.get();
  final ILocalStorage storage = Modular.get();

  HomeStoreBase() {
    buscaTheme();
  }

  logout() async {
    await storage.delete('login-normal');
    await storage.delete('user');
    await storage.delete('token');
    await SessionManager().remove('token');
    await Modular.get<AuthController>().logout();
  }

  changeSwitch(value) {
    value = value ? ['dark'] : ['light'];
    storage.put('theme', value);
  }

  buscaTheme() {
    storage.get('theme').then((value) {
      if (value?[0] == 'dark') {
        client.setTheme(true);
      } else {
        client.setTheme(false);
      }
    });
  }
}
