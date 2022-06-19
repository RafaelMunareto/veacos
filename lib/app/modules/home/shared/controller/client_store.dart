import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:veacos/app/shared/repositories/localstorage/local_storage_interface.dart';

part 'client_store.g.dart';

class ClientStore = _ClientStoreBase with _$ClientStore;

abstract class _ClientStoreBase with Store {
  ILocalStorage storage = Modular.get();

  @observable
  int bottomNavigateIndex = 0;

  @action
  setBottomNavigateIndex(value) => bottomNavigateIndex = value;

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
}
