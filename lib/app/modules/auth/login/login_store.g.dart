// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStoreBase, Store {
  late final _$supportStateAtom =
      Atom(name: '_LoginStoreBase.supportState', context: context);

  @override
  SupportState get supportState {
    _$supportStateAtom.reportRead();
    return super.supportState;
  }

  @override
  set supportState(SupportState value) {
    _$supportStateAtom.reportWrite(value, super.supportState, () {
      super.supportState = value;
    });
  }

  late final _$faceOrFingerAtom =
      Atom(name: '_LoginStoreBase.faceOrFinger', context: context);

  @override
  bool get faceOrFinger {
    _$faceOrFingerAtom.reportRead();
    return super.faceOrFinger;
  }

  @override
  set faceOrFinger(bool value) {
    _$faceOrFingerAtom.reportWrite(value, super.faceOrFinger, () {
      super.faceOrFinger = value;
    });
  }

  late final _$loginStorageAtom =
      Atom(name: '_LoginStoreBase.loginStorage', context: context);

  @override
  List<String>? get loginStorage {
    _$loginStorageAtom.reportRead();
    return super.loginStorage;
  }

  @override
  set loginStorage(List<String>? value) {
    _$loginStorageAtom.reportWrite(value, super.loginStorage, () {
      super.loginStorage = value;
    });
  }

  late final _$canCheckBiometricsAtom =
      Atom(name: '_LoginStoreBase.canCheckBiometrics', context: context);

  @override
  bool get canCheckBiometrics {
    _$canCheckBiometricsAtom.reportRead();
    return super.canCheckBiometrics;
  }

  @override
  set canCheckBiometrics(bool value) {
    _$canCheckBiometricsAtom.reportWrite(value, super.canCheckBiometrics, () {
      super.canCheckBiometrics = value;
    });
  }

  late final _$availableBiometricsAtom =
      Atom(name: '_LoginStoreBase.availableBiometrics', context: context);

  @override
  List<BiometricType> get availableBiometrics {
    _$availableBiometricsAtom.reportRead();
    return super.availableBiometrics;
  }

  @override
  set availableBiometrics(List<BiometricType> value) {
    _$availableBiometricsAtom.reportWrite(value, super.availableBiometrics, () {
      super.availableBiometrics = value;
    });
  }

  late final _$authorizedAtom =
      Atom(name: '_LoginStoreBase.authorized', context: context);

  @override
  String get authorized {
    _$authorizedAtom.reportRead();
    return super.authorized;
  }

  @override
  set authorized(String value) {
    _$authorizedAtom.reportWrite(value, super.authorized, () {
      super.authorized = value;
    });
  }

  late final _$isAuthenticatingAtom =
      Atom(name: '_LoginStoreBase.isAuthenticating', context: context);

  @override
  bool get isAuthenticating {
    _$isAuthenticatingAtom.reportRead();
    return super.isAuthenticating;
  }

  @override
  set isAuthenticating(bool value) {
    _$isAuthenticatingAtom.reportWrite(value, super.isAuthenticating, () {
      super.isAuthenticating = value;
    });
  }

  late final _$userAtom = Atom(name: '_LoginStoreBase.user', context: context);

  @override
  dynamic get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(dynamic value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$getAvailableBiometricsAsyncAction =
      AsyncAction('_LoginStoreBase.getAvailableBiometrics', context: context);

  @override
  Future getAvailableBiometrics() {
    return _$getAvailableBiometricsAsyncAction
        .run(() => super.getAvailableBiometrics());
  }

  late final _$getStorageLoginAsyncAction =
      AsyncAction('_LoginStoreBase.getStorageLogin', context: context);

  @override
  Future getStorageLogin() {
    return _$getStorageLoginAsyncAction.run(() => super.getStorageLogin());
  }

  late final _$checkSupportDeviceAsyncAction =
      AsyncAction('_LoginStoreBase.checkSupportDevice', context: context);

  @override
  Future checkSupportDevice() {
    return _$checkSupportDeviceAsyncAction
        .run(() => super.checkSupportDevice());
  }

  late final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase', context: context);

  @override
  dynamic setUser(dynamic value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic checkBiometrics() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.checkBiometrics');
    try {
      return super.checkBiometrics();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic authenticateBiometric() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.authenticateBiometric');
    try {
      return super.authenticateBiometric();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic submitStorage() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.submitStorage');
    try {
      return super.submitStorage();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
supportState: ${supportState},
faceOrFinger: ${faceOrFinger},
loginStorage: ${loginStorage},
canCheckBiometrics: ${canCheckBiometrics},
availableBiometrics: ${availableBiometrics},
authorized: ${authorized},
isAuthenticating: ${isAuthenticating},
user: ${user}
    ''';
  }
}
