import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:veacos/app/modules/auth/shared/client_auth_store.dart';
import 'package:veacos/app/shared/auth/auth_controller.dart';

part 'forget_store.g.dart';

class ForgetStore = _ForgetStoreBase with _$ForgetStore;

abstract class _ForgetStoreBase with Store {
  AuthController auth = Modular.get();
  ClientAuthStore client = Modular.get();

  _ForgetStoreBase() {
    client.buscaTheme();
  }

  submit() {
    client.setLoading(true);
    auth.sendEmailChangePassword(client.email).then((value) async {
      client.setMsgErrOrGoal(true);
      client.setMsg(value?.data);
    }).catchError((error) {
      client.setMsgErrOrGoal(false);
      client.setMsg(client.setMessageError(error));
    }).whenComplete(() => client.setLoading(false));
  }
}
