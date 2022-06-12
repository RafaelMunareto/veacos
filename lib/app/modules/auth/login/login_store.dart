import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
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
    buscaTheme();
  }

  buscaTheme() {
    storage.get('theme').then((value) {
      if (value?[0] == 'dark') {
        client.setTheme(true);
      } else {
        client.setTheme(false);
      }
    });
  }

  @observable
  SupportState supportState = SupportState.unknown;

  @observable
  String msg = '';

  @observable
  bool faceOrFinger = true;

  @observable
  bool errOrGoal = false;

  @observable
  List<String>? loginStorage;

  @action
  setErrOrGoal(value) => errOrGoal = value;

  @action
  setMsg(value) => msg = value;

  //biometric
  @observable
  bool canCheckBiometrics = false;

  @observable
  List<BiometricType> availableBiometrics = [];

  @observable
  String authorized = 'Não autorizado!';

  @observable
  bool isAuthenticating = false;

  @observable
  dynamic user;

  @action
  setUser(value) => user = value;

  String textToMd5(String text) {
    return md5.convert(utf8.encode(text)).toString();
  }

  submit() async {
    await client.setLoading(true);
    await auth
        .getLoginDio(client.email.trim(), client.password)
        .then((value) async {
      client.setLoading(false);
      setErrOrGoal(false);
      UserModel user = UserModel.fromJson(value.data);
      SessionManager().set("token", user.jwtToken);
      await storage.put('token', [user.jwtToken]);
      await storage.put('user', [jsonEncode(user)]);
      await storage.put('biometric', [
        textToMd5(client.email.toLowerCase().trim()),
        textToMd5(client.password)
      ]);
      await storage.put('login-normal', [
        textToMd5(client.email.toLowerCase().trim()),
        textToMd5(client.password)
      ]);
    }).catchError((error) {
      client.setLoading(false);
      setErrOrGoal(false);
      setMsg(error?.message);
    }).whenComplete(() => Modular.to.navigate('/home/'));
  }

  //gooole
  loginWithGoogle() async {
    client.setLoading(true);
    try {
      await auth.loginWithGoogle().then((value) {
        auth.getLoginDio(value.email, value.password).then((e) async {
          UserModel user = UserModel.fromJson(e.data);
          await SessionManager().set("token", user.jwtToken);
          await storage.put('token', [user.jwtToken]);
          await storage.put('user', [jsonEncode(user)]);
          await storage.put('login-normal',
              [textToMd5(value.email), textToMd5(value.password)]);
          await storage.put(
              'biometric', [textToMd5(value.email), textToMd5(value.password)]);
          client.setLoading(false);
          Modular.to.navigate('/home/');
        });
      }).onError((error, stackTrace) {
        client.setLoading(false);
        setErrOrGoal(false);
        setMsg(error.toString());
      });
    } catch (erro) {
      client.setLoading(false);
      setErrOrGoal(false);
      setMsg(erro.toString());
    }
  }

  //biometric
  @action
  checkBiometrics() {
    auth.biometricRepository
        .checkBiometrics()
        .then((value) => canCheckBiometrics = value);
  }

  @action
  getAvailableBiometrics() async {
    await auth.biometricRepository
        .getAvailableBiometrics()
        .then((value) => availableBiometrics = value);
    if (availableBiometrics.contains(BiometricType.face)) {
      faceOrFinger = true;
    } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
      faceOrFinger = false;
    }
  }

  @action
  authenticateBiometric() {
    auth.authenticateWithBiometrics(faceOrFinger).then((value) {
      if (value == 'Authorized') {
        if (loginStorage![0] != '') {
          client.setLoading(true);
          auth
              .getLoginDio(loginStorage![0], loginStorage![1])
              .then((value) async {
            client.setLoading(false);
            setErrOrGoal(false);
            UserModel user = UserModel.fromJson(value.data);
            SessionManager().set("token", user.jwtToken);
            await storage.put('token', [user.jwtToken]);
            await storage.put('user', [jsonEncode(user)]);
            await storage.put('login-normal',
                [textToMd5(client.email), textToMd5(client.password)]);
            Modular.to.navigate('/home/');
          }).catchError((error) {
            client.setLoading(false);
            setErrOrGoal(false);
            setMsg(error.response?.data['error'] ?? error?.message);
          });
        }
      }
    });
  }

  @action
  getStorageLogin() async {
    await storage.get('biometric').then((value) {
      if (value != null) {
        loginStorage = value;
      }
    });
  }

  //check support device
  @action
  checkSupportDevice() async {
    await getStorageLogin();
    if (!kIsWeb && defaultTargetPlatform != TargetPlatform.windows) {
      await bio.isDeviceSupported().then((isSupported) => supportState =
          isSupported && loginStorage != null
              ? SupportState.supported
              : SupportState.unsupported);
      await checkBiometrics();
      await getAvailableBiometrics();
    }
  }

  @action
  submitStorage() {
    storage.get('login-normal').then((value) {
      if (value != null) {
        if (value.isNotEmpty) {
          auth.getLoginDio(value[0], value[1]).then((value) {
            client.setLoading(false);
            setErrOrGoal(false);
            Modular.to.navigate('/home/');
          }).catchError((error) {
            client.setLoading(false);
            setErrOrGoal(false);
            setMsg(error.response?.data['error'] ?? error?.message);
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
