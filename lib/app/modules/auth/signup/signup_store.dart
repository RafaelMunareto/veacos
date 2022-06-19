import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:mobx/mobx.dart';
import 'package:veacos/app/modules/auth/shared/client_auth_store.dart';
import 'package:veacos/app/shared/auth/auth_controller.dart';
import 'package:veacos/app/shared/auth/model/user_client.model.dart';
import 'package:veacos/app/shared/auth/model/user_model.dart';
import 'package:veacos/app/shared/repositories/localstorage/local_storage_interface.dart';

part 'signup_store.g.dart';

class SignupStore = _SignupStoreBase with _$SignupStore;

abstract class _SignupStoreBase with Store {
  ClientAuthStore client = Modular.get();
  ILocalStorage storage = Modular.get();
  AuthController auth = Modular.get();

  _SignupStoreBase() {
    client.buscaTheme();
  }

  @computed
  bool get isValidRegisterEmailGrupo {
    return client.validateName() == null &&
        client.validatePassword() == null &&
        client.validateConfirmPassword() == null;
  }

  @action
  void submit() {
    UserClientModel model = UserClientModel(
        email: client.email, name: client.name, password: client.password);
    client.setLoading(true);
    auth.saveUser(model).then((value) {
      client.setMsgErrOrGoal(true);
      client.setMsg('Usuário criado com sucesso');
      client.setLoading(false);

      auth.getLoginDio(client.email, client.password).then((value) async {
        UserModel user = UserModel.fromJson(value.data);
        SessionManager().set("token", user.jwtToken);
        storage.put('token', [user.jwtToken]);
        await storage.put('user', [jsonEncode(user)]);
        await storage.put('biometric', [client.email, client.password]);
        Modular.to.navigate('/auth/');
      });
    }).catchError((error) {
      client.setMsgErrOrGoal(false);
      client.setMsg(client.setMessageError(error));
      client.setLoading(false);
    });
  }
}
