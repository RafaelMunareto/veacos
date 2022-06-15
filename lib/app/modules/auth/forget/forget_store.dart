import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:veacos/app/modules/auth/shared/client_auth_store.dart';
import 'package:veacos/app/shared/auth/auth_controller.dart';
import 'package:veacos/app/shared/repositories/localstorage/local_storage_interface.dart';

part 'forget_store.g.dart';

class ForgetStore = _ForgetStoreBase with _$ForgetStore;

abstract class _ForgetStoreBase with Store {
  AuthController auth = Modular.get();
  ClientAuthStore client = Modular.get();
  ILocalStorage storage = Modular.get();

  _ForgetStoreBase() {
    buscaTheme();
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

  submit() {
    client.setLoading(true);
    auth.sendEmailChangePassword(client.email).then((value) async {
      client.setLoading(false);
      value?.data == 'Email enviado com sucesso!'
          ? client.setMsgErrOrGoal(true)
          : client.setMsgErrOrGoal(false);
      client.setMsg(value?.data);
    }).catchError((error) {
      client.setLoading(false);
      client.setMsgErrOrGoal(false);
      client.setMsg(error?.message);
    });
  }
}
