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

  var loading$ = ValueNotifier(false);
  setLoading(value) => loading$.value = value;

  submit() async {
    setLoading(true);
    await auth.sendEmailChangePassword(client.email$.value).then((value) {
      setMsgErrOrGoal(true);
      setMsg(value?.data);
    }).catchError((error) {
      setMsgErrOrGoal(false);
      setMsg(client.setMessageError(error));
    }).whenComplete(() => setLoading(false));
  }
}
