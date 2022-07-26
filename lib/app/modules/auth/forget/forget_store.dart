import 'package:flutter_modular/flutter_modular.dart';
import 'package:veacos/app/modules/auth/shared/client_auth_store.dart';
import 'package:veacos/app/shared/auth/auth_controller.dart';

class ForgetStore {
  AuthController auth = Modular.get();
  ClientAuthStore client = Modular.get();

  ForgetStore() {
    client.buscaTheme();
  }

  submit() async {
    await client.setLoading(true);
    auth.sendEmailChangePassword(client.email$.value).then((value) async {
      client.setMsgErrOrGoalForget(true);
      client.setMsgForget(value?.data);
    }).catchError((error) {
      client.setMsgErrOrGoalForget(false);
      client.setMsgForget(client.setMessageError(error));
    }).whenComplete(() => client.setLoading(false));
  }
}
