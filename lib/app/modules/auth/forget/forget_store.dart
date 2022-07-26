import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:veacos/app/modules/auth/shared/client_auth_store.dart';
import 'package:veacos/app/shared/auth/auth_controller.dart';

class ForgetStore {
  AuthController auth = Modular.get();
  ClientAuthStore client = Modular.get();

  ForgetStore() {
    client.buscaTheme();
  }

  var msg$ = ValueNotifier('');
  setMsg(value) => msg$.value = value;

  var msgErrOrGoal$ = ValueNotifier(false);
  setMsgErrOrGoal(value) => msgErrOrGoal$.value = value;

  submit() async {
    await client.setLoading(true);
    auth.sendEmailChangePassword(client.email$.value).then((value) async {
      setMsgErrOrGoal(true);
      setMsg(value?.data);
    }).catchError((error) {
      setMsgErrOrGoal(false);
      setMsg(client.setMessageError(error));
    }).whenComplete(() => client.setLoading(false));
  }
}
