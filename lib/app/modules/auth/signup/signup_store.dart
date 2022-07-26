import 'dart:convert';
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

  bool get isValidRegisterEmailGrupo {
    return client.validateName() == null &&
        client.validatePassword() == null &&
        client.validateConfirmPassword() == null;
  }

  void submit() {
    UserClientModel model = UserClientModel(
        email: client.email$.value,
        name: client.name$.value,
        password: client.password$.value);
    client.setLoading(true);
    auth.saveUser(model).then((value) {
      client.setMsgErrOrGoal(true);
      client.setMsg('Usuário criado com sucesso');
      client.setLoading(false);

      auth.getLoginDio(client.email$, client.password$).then((value) async {
        UserModel user = UserModel.fromJson(value.data);
        SessionManager().set("token", user.jwtToken);
        storage.put('token', [user.jwtToken]);
        await storage.put('user', [jsonEncode(user)]);
        await storage
            .put('biometric', [client.email$.value, client.password$.value]);
        Modular.to.navigate('/auth/');
      });
    }).catchError((error) {
      client.setMsgErrOrGoal(false);
      client.setMsg(client.setMessageError(error));
      client.setLoading(false);
    });
  }
}
