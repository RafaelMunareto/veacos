import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:veacos/app/modules/auth/shared/client_auth_store.dart';
import 'package:veacos/app/shared/auth/auth_controller.dart';
import 'package:veacos/app/shared/auth/model/user_client.model.dart';
import 'package:veacos/app/shared/auth/model/user_model.dart';
import 'package:veacos/app/shared/repositories/localstorage/local_storage_interface.dart';

class SignupStore {
  ClientAuthStore client = Modular.get();
  ILocalStorage storage = Modular.get();
  AuthController auth = Modular.get();

  SignupStore() {
    client.buscaTheme();
  }

  var msg$ = ValueNotifier('');
  setMsg(value) => msg$.value = value;

  var msgErrOrGoal$ = ValueNotifier(false);
  setMsgErrOrGoal(value) => msgErrOrGoal$.value = value;

  submit() {
    UserClientModel model = UserClientModel(
        email: client.email$.value,
        name: client.name$.value,
        password: client.password$.value);
    client.setLoading(true);
    auth.saveUser(model).then((r) {
      setMsgErrOrGoal(true);
      setMsg('Usuário criado com sucesso');
      auth
          .getLoginDio(client.email$.value, client.password$.value)
          .then((value) async {
        UserModel user = UserModel.fromMap(value.data);
        SessionManager().set("token", user.jwtToken);
        storage.put('token', [user.jwtToken]);
        await storage.put('user', [jsonEncode(user)]);
        await storage
            .put('biometric', [client.email$.value, client.password$.value]);
        Modular.to.navigate('/auth/');
      });
    }).catchError((error) {
      setMsgErrOrGoal(false);
      setMsg(client.setMessageError(error));
    }).whenComplete(() => client.setLoading(false));
  }
}
