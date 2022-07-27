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

  var loading$ = ValueNotifier(false);
  setLoading(value) => loading$.value = value;

  var code$ = ValueNotifier('');
  setCode(value) => code$.value = value;

  submit() {
    if (code$.value != '') {
      setLoading(true);
      auth
          .changeUserPassword(code$.value, client.confirmPassword$.value)
          .then((value) {
        setMsgErrOrGoal(true);
        setMsg('Senha alterada com sucesso!');
      }).catchError((error) {
        setLoading(false);
        setMsgErrOrGoal(false);
        setMsg(client.setMessageError(error));
      }).whenComplete(() => setLoading(false));
    } else {
      setMsgErrOrGoal(false);
      setMsg('Usuário não encontrado na base');
    }
  }
}
