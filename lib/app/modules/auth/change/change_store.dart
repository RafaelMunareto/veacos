import 'package:flutter/foundation.dart';
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

  var msg$ = ValueNotifier('');
  setMsg(value) => msg$.value = value;

  var msgErrOrGoal$ = ValueNotifier(false);
  setMsgErrOrGoal(value) => msgErrOrGoal$.value = value;

  submit() {
    if (client.code$.value != '') {
      client.setLoading(true);
      auth
          .changeUserPassword(client.code$.value, client.confirmPassword$.value)
          .then((value) {
        client.setLoading(false);
        setMsgErrOrGoal(true);
        setMsg('Senha alterada com sucesso!');
      }).catchError((error) {
        client.setLoading(false);
        setMsgErrOrGoal(false);
        setMsg(client.setMessageError(error));
      });
    } else {
      setMsgErrOrGoal(false);
      setMsg('Usuário não encontrado na base');
    }
  }
}
