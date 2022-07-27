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

  var supportState$ = ValueNotifier(SupportState.unknown);

  var faceOrFinger$ = ValueNotifier(true);

  var loginStorage$ = ValueNotifier([]);

  var loading$ = ValueNotifier(false);
  setLoading(value) => loading$.value = value;

  //biometric
  var canCheckBiometrics$ = ValueNotifier(false);

  var availableBiometrics$ = ValueNotifier([]);

  var authorized$ = ValueNotifier('Não autorizado!');

  var isAuthenticating$ = ValueNotifier(false);

  submit() async {
    await setLoading(true);
    await auth
        .getLoginDio(client.email$.value, client.password$.value)
        .then((value) async {
      setMsgErrOrGoal(false);
      UserModel user = UserModel.fromMap(value.data);
      SessionManager().set("token", user.jwtToken);
      await storage.put('token', [user.jwtToken]);
      await storage.put('user', [jsonEncode(value.data)]);
      await storage
          .put('biometric', [client.email$.value, client.password$.value]);
      await storage
          .put('login-normal', [client.email$.value, client.password$.value]);
      Modular.to.navigate('/home/');
    }).catchError((error) {
      setLoading(false);
      setMsgErrOrGoal(false);
      setMsg(client.setMessageError(error));
    }).whenComplete(() => setLoading(false));
  }

  loginWithGoogle() async {
    setLoading(true);
    try {
      await auth.loginWithGoogle().then((value) {
        auth
            .getLoginDio(value.email$.value, value.password$.value)
            .then((value) async {
          UserModel user = UserModel.fromMap(value.data);
          await SessionManager().set("token", user.jwtToken);
          await storage.put('token', [user.jwtToken]);
          await storage.put('user', [jsonEncode(value.data)]);
          await storage.put('login-normal', [value.email$, value.password$]);
          await storage.put('biometric', [value.email$, value.password$]);
          Modular.to.navigate('/home/');
        });
      }).onError((error, stackTrace) {
        setLoading(false);
        setMsgErrOrGoal(false);
        setMsg(client.setMessageError(error));
      }).whenComplete(() => setLoading(false));
    } catch (erro) {
      setLoading(false);
      setMsgErrOrGoal(false);
      setMsg(client.setMessageError(erro));
    }
  }

  checkBiometrics() {
    auth.biometricRepository
        .checkBiometrics()
        .then((value) => canCheckBiometrics$.value = value);
  }

  getAvailableBiometrics() async {
    await auth.biometricRepository
        .getAvailableBiometrics()
        .then((value) => availableBiometrics$.value = value);
    if (availableBiometrics$.value.contains(BiometricType.face)) {
      faceOrFinger$.value = true;
    } else if (availableBiometrics$.value.contains(BiometricType.fingerprint)) {
      faceOrFinger$.value = false;
    }
  }

  authenticateBiometric() async {
    await auth
        .authenticateWithBiometrics(faceOrFinger$.value)
        .then((value) async {
      if (value == 'Authorized') {
        if (loginStorage$.value[0] != '') {
          setLoading(true);
          await auth
              .getLoginDio(loginStorage$.value[0], loginStorage$.value[1])
              .then((value) async {
            UserModel user = UserModel.fromMap(value.data);
            await SessionManager().set("token", user.jwtToken);
            await storage.put('token', [user.jwtToken]);
            await storage.put('user', [jsonEncode(value.data)]);
            Modular.to.navigate('/home/');
          }).catchError((error) {
            setMsgErrOrGoal(false);
            setMsg(client.setMessageError(error));
          }).whenComplete(() => setLoading(false));
        }
      }
    });
  }

  getStorageLogin() async {
    await storage.get('biometric').then((value) {
      if (value != null) {
        loginStorage$.value = value;
      }
    });
  }

  checkSupportDevice() async {
    await getStorageLogin();
    await bio.isDeviceSupported().then((isSupported) => supportState$.value =
        isSupported && loginStorage$.value.isNotEmpty
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
              .getLoginDio(value[0], value[1])
              .then((value) {
                setLoading(false);
                setMsgErrOrGoal(false);
              })
              .then((value) => Modular.to.navigate('/home/'))
              .catchError((error) {
                setLoading(false);
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
