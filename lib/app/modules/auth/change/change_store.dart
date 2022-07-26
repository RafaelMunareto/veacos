import 'package:flutter_modular/flutter_modular.dart';
import 'package:veacos/app/modules/auth/shared/client_auth_store.dart';
import 'package:veacos/app/shared/auth/auth_controller.dart';
import 'package:veacos/app/shared/repositories/localstorage/local_storage_interface.dart';

class ChangeStore {
  AuthController auth = Modular.get();
  ClientAuthStore client = Modular.get();
  ILocalStorage storage = Modular.get();

  ChangeStore() {
    client.buscaTheme();
  }

  submit() {
    if (client.code$.value != '') {
      client.setLoading(true);
      auth
          .changeUserPassword(client.code$.value, client.confirmPassword$.value)
          .then((value) {
        client.setLoading(false);
        client.setMsgErrOrGoal(true);
        client.setMsg('Senha alterada com sucesso!');
      }).catchError((error) {
        client.setLoading(false);
        client.setMsgErrOrGoal(false);
        client.setMsg(client.setMessageError(error));
      });
    } else {
      client.setMsgErrOrGoal(false);
      client.setMsg('Usuário não encontrado na base');
    }
  }
}
