import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:veacos/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:veacos/app/shared/auth/repositories/biometric_repository_interface.dart';
import 'package:veacos/app/shared/repositories/localstorage/local_storage_interface.dart';
import 'package:veacos/app/shared/repositories/localstorage/local_storage_share.dart';

import 'model/user_client.model.dart';

class AuthController {
  final IAuthRepository authRepository;
  final ILocalStorage storage = LocalStorageShare();
  final IBiometricRepository biometricRepository;

  var status$ = ValueNotifier(AuthStatus.loading);
  setStatus(value) => status$.value = value;
  var user$ = ValueNotifier(null);
  setUsers(value) => user$.value = value;

  AuthController(
      {required this.authRepository, required this.biometricRepository});

  setUser(UserClientModel value) {
    storage.get('user').then((value) {
      if (value != null) {
        setUsers(UserClientModel.fromJson(jsonDecode(value[0])['user']));
      }
    });
    setStatus(user$.value?.email == '' ? AuthStatus.logoff : AuthStatus.login);
  }

  Future loginWithGoogle() {
    return authRepository.getGoogleLogin();
  }

  logout() {
    return authRepository.getLogout();
  }

  //biometric
  Future checkBiometrics() {
    return biometricRepository.checkBiometrics();
  }

  Future getAvailableBiometrics() {
    return biometricRepository.getAvailableBiometrics();
  }

  Future<String> authenticateWithBiometrics(bool faceOrFinger) {
    return biometricRepository.authenticateWithBiometrics(faceOrFinger);
  }

  cancelAuthentication() {
    return biometricRepository.cancelAuthentication();
  }

  Future getLoginDio(email, password) {
    return authRepository.loginDio(email, password);
  }

  saveUser(UserClientModel model) {
    return authRepository.saveUser(model);
  }

  Future perfilUser(UserClientModel user) {
    return authRepository.perfilUser(user);
  }

  Future sendEmailChangePassword(String email) {
    return authRepository.sendEmailChangePassword(email);
  }

  Future changeUserPassword(String id, String password) {
    return authRepository.changeUserPassword(id, password);
  }
}

enum AuthStatus { loading, login, logoff }
