import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:local_auth/local_auth.dart';
import 'package:veacos/app/modules/auth/shared/client_auth_store.dart';
import 'package:veacos/app/shared/auth/auth_controller.dart';
import 'package:veacos/app/shared/auth/model/user_model.dart';
import 'package:veacos/app/shared/repositories/localstorage/local_storage_interface.dart';

class LoginStore {
  ClientAuthStore client = Modular.get();
  ILocalStorage storage = Modular.get();
  AuthController auth = Modular.get();
  final LocalAuthentication bio = Modular.get();

  LoginStore() {
    client.buscaTheme();
    checkSupportDevice();
  }

  var msg$ = ValueNotifier('');
  setMsg(value) => msg$.value = value;

  var msgErrOrGoal$ = ValueNotifier(false);
  setMsgErrOrGoal(value) => msgErrOrGoal$.value = value;

  submit() async {
    client.setLoading(true);
    await auth
        .getLoginDio(client.email$, client.password$)
        .then((value) async {
          setMsgErrOrGoal(false);
          UserModel user = UserModel.fromMap(value.data);
          SessionManager().set("token", user.jwtToken);
          await storage.put('token', [user.jwtToken]);
          await storage.put('user', [jsonEncode(value.data)]);
          await storage.put('biometric', [
            client.email$.value,
            client.encryptMyData(client.password$.value)
          ]);
          await storage.put('login-normal', [
            client.email$.value,
            client.encryptMyData(client.password$.value)
          ]);
        })
        .then((value) => Modular.to.navigate('/home/'))
        .catchError((error) {
          client.setLoading(false);
          setMsgErrOrGoal(false);
          setMsg(client.setMessageError(error));
        })
        .whenComplete(() => client.setLoading(false));
  }

  loginWithGoogle() async {
    client.setLoading(true);
    try {
      await auth
          .loginWithGoogle()
          .then((value) {
            auth.getLoginDio(value.email$, value.password$).then((value) async {
              UserModel user = UserModel.fromMap(value.data);
              await SessionManager().set("token", user.jwtToken);
              await storage.put('token', [user.jwtToken]);
              await storage.put('user', [jsonEncode(value.data)]);
              await storage.put('login-normal',
                  [value.email$, client.encryptMyData(value.password$)]);
              await storage.put('biometric',
                  [value.email$, client.encryptMyData(value.password$)]);
              client.setLoading(false);
            });
          })
          .then((value) => Modular.to.navigate('/home/'))
          .onError((error, stackTrace) {
            client.setLoading(false);
            setMsgErrOrGoal(false);
            setMsg(client.setMessageError(error));
          });
    } catch (erro) {
      client.setLoading(false);
      setMsgErrOrGoal(false);
      setMsg(erro);
    }
  }

  checkBiometrics() {
    auth.biometricRepository
        .checkBiometrics()
        .then((value) => client.canCheckBiometrics$.value = value);
  }

  getAvailableBiometrics() async {
    await auth.biometricRepository
        .getAvailableBiometrics()
        .then((value) => client.availableBiometrics$.value = value);
    if (client.availableBiometrics$.value.contains(BiometricType.face)) {
      client.faceOrFinger$.value = true;
    } else if (client.availableBiometrics$.value
        .contains(BiometricType.fingerprint)) {
      client.faceOrFinger$.value = false;
    }
  }

  authenticateBiometric() {
    auth.authenticateWithBiometrics(client.faceOrFinger$.value).then((value) {
      if (value == 'Authorized') {
        if (client.loginStorage$.value[0] != '') {
          client.setLoading(true);
          auth
              .getLoginDio(client.loginStorage$.value[0],
                  client.decryptMyData(client.loginStorage$.value[1]))
              .then((value) async {
                client.setLoading(false);
                setMsgErrOrGoal(false);
                UserModel user = UserModel.fromMap(value.data);
                SessionManager().set("token", user.jwtToken);
                await storage.put('token', [user.jwtToken]);
                await storage.put('user', [jsonEncode(value.data)]);
              })
              .then((value) => Modular.to.navigate('/home/'))
              .catchError((error) {
                client.setLoading(false);
                setMsgErrOrGoal(false);
                setMsg(client.setMessageError(error));
              });
        }
      }
    });
  }

  getStorageLogin() async {
    await storage.get('biometric').then((value) {
      if (value != null) {
        client.loginStorage$.value = value;
      }
    });
  }

  checkSupportDevice() async {
    await getStorageLogin();
    await bio.isDeviceSupported().then((isSupported) =>
        client.supportState$.value =
            isSupported ? SupportState.supported : SupportState.unsupported);
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
                setMsgErrOrGoal(false);
              })
              .then((value) => Modular.to.navigate('/home/'))
              .catchError((error) {
                client.setLoading(false);
                setMsgErrOrGoal(false);
                setMsg(client.setMessageError(error));
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
