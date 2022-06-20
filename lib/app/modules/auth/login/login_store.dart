import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:veacos/app/modules/auth/shared/client_auth_store.dart';
import 'package:veacos/app/shared/auth/auth_controller.dart';
import 'package:veacos/app/shared/auth/model/user_model.dart';
import 'package:veacos/app/shared/repositories/localstorage/local_storage_interface.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  ClientAuthStore client = Modular.get();
  ILocalStorage storage = Modular.get();
  AuthController auth = Modular.get();
  final LocalAuthentication bio = Modular.get();

  _LoginStoreBase() {
    client.buscaTheme();
    checkSupportDevice();
  }

  submit() async {
    await client.setLoading(true);
    await auth
        .getLoginDio(client.email, client.password)
        .then((value) async {
          client.setLoading(false);
          client.setMsgErrOrGoal(false);
          UserModel user = UserModel.fromJson(value.data);
          SessionManager().set("token", user.jwtToken);
          await storage.put('token', [user.jwtToken]);
          await storage.put('user', [jsonEncode(value.data)]);
          await storage.put('biometric',
              [client.email, client.encryptMyData(client.password)]);
          await storage.put('login-normal',
              [client.email, client.encryptMyData(client.password)]);
        })
        .then((value) => Modular.to.navigate('/home/'))
        .catchError((error) {
          client.setLoading(false);
          client.setMsgErrOrGoal(false);
          client.setMsg(client.setMessageError(error));
        });
  }

  loginWithGoogle() async {
    client.setLoading(true);
    try {
      await auth
          .loginWithGoogle()
          .then((value) {
            auth.getLoginDio(value.email, value.password).then((value) async {
              UserModel user = UserModel.fromJson(value.data);
              await SessionManager().set("token", user.jwtToken);
              await storage.put('token', [user.jwtToken]);
              await storage.put('user', [jsonEncode(value.data)]);
              await storage.put('login-normal',
                  [value.email, client.encryptMyData(value.password)]);
              await storage.put('biometric',
                  [value.email, client.encryptMyData(value.password)]);
              client.setLoading(false);
            });
          })
          .then((value) => Modular.to.navigate('/home/'))
          .onError((error, stackTrace) {
            client.setLoading(false);
            client.setMsgErrOrGoal(false);
            client.setMsg(client.setMessageError(error));
          });
    } catch (erro) {
      client.setLoading(false);
      client.setMsgErrOrGoal(false);
      client.setMsg(erro);
    }
  }

  checkBiometrics() {
    auth.biometricRepository
        .checkBiometrics()
        .then((value) => client.canCheckBiometrics = value);
  }

  getAvailableBiometrics() async {
    await auth.biometricRepository
        .getAvailableBiometrics()
        .then((value) => client.availableBiometrics = value);
    if (client.availableBiometrics.contains(BiometricType.face)) {
      client.faceOrFinger = true;
    } else if (client.availableBiometrics.contains(BiometricType.fingerprint)) {
      client.faceOrFinger = false;
    }
  }

  authenticateBiometric() {
    auth.authenticateWithBiometrics(client.faceOrFinger).then((value) {
      if (value == 'Authorized') {
        if (client.loginStorage![0] != '') {
          client.setLoading(true);
          auth
              .getLoginDio(client.loginStorage![0],
                  client.decryptMyData(client.loginStorage![1]))
              .then((value) async {
                client.setLoading(false);
                client.setMsgErrOrGoal(false);
                UserModel user = UserModel.fromJson(value.data);
                SessionManager().set("token", user.jwtToken);
                await storage.put('token', [user.jwtToken]);
                await storage.put('user', [jsonEncode(value.data)]);
              })
              .then((value) => Modular.to.navigate('/home/'))
              .catchError((error) {
                client.setLoading(false);
                client.setMsgErrOrGoal(false);
                client.setMsg(client.setMessageError(error));
              });
        }
      }
    });
  }

  @action
  getStorageLogin() async {
    await storage.get('biometric').then((value) {
      if (value != null) {
        client.loginStorage = value;
      }
    });
  }

  checkSupportDevice() async {
    await getStorageLogin();
    await bio.isDeviceSupported().then((isSupported) => client.supportState =
        isSupported && client.loginStorage != null
            ? SupportState.supported
            : SupportState.unsupported);
    await checkBiometrics();
    await getAvailableBiometrics();
  }

  submitStorage() {
    storage.get('login-normal').then((value) {
      if (value != null) {
        if (value.isNotEmpty) {
          auth
              .getLoginDio(value[0], client.decryptMyData(value[1]))
              .then((value) {
                client.setLoading(false);
                client.setMsgErrOrGoal(false);
              })
              .then((value) => Modular.to.navigate('/home/'))
              .catchError((error) {
                client.setLoading(false);
                client.setMsgErrOrGoal(false);
                client.setMsg(client.setMessageError(error));
              });
        }
      }
    });
  }
}

enum SupportState {
  unknown,
  supported,
  unsupported,
}
