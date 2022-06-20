// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ClientAuthStore on _ClientAuthStoreBase, Store {
  Computed<bool>? _$isValidLoginComputed;

  @override
  bool get isValidLogin =>
      (_$isValidLoginComputed ??= Computed<bool>(() => super.isValidLogin,
              name: '_ClientAuthStoreBase.isValidLogin'))
          .value;
  Computed<bool>? _$isValidSignupComputed;

  @override
  bool get isValidSignup =>
      (_$isValidSignupComputed ??= Computed<bool>(() => super.isValidSignup,
              name: '_ClientAuthStoreBase.isValidSignup'))
          .value;
  Computed<bool>? _$isValidChangePasswordComputed;

  @override
  bool get isValidChangePassword => (_$isValidChangePasswordComputed ??=
          Computed<bool>(() => super.isValidChangePassword,
              name: '_ClientAuthStoreBase.isValidChangePassword'))
      .value;
  Computed<bool>? _$isValidEmailComputed;

  @override
  bool get isValidEmail =>
      (_$isValidEmailComputed ??= Computed<bool>(() => super.isValidEmail,
              name: '_ClientAuthStoreBase.isValidEmail'))
          .value;

  late final _$loadingAtom =
      Atom(name: '_ClientAuthStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$themeAtom =
      Atom(name: '_ClientAuthStoreBase.theme', context: context);

  @override
  bool get theme {
    _$themeAtom.reportRead();
    return super.theme;
  }

  @override
  set theme(bool value) {
    _$themeAtom.reportWrite(value, super.theme, () {
      super.theme = value;
    });
  }

  late final _$codeAtom =
      Atom(name: '_ClientAuthStoreBase.code', context: context);

  @override
  String get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  late final _$nameAtom =
      Atom(name: '_ClientAuthStoreBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_ClientAuthStoreBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_ClientAuthStoreBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$confirmPasswordAtom =
      Atom(name: '_ClientAuthStoreBase.confirmPassword', context: context);

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$checkErrorAtom =
      Atom(name: '_ClientAuthStoreBase.checkError', context: context);

  @override
  bool get checkError {
    _$checkErrorAtom.reportRead();
    return super.checkError;
  }

  @override
  set checkError(bool value) {
    _$checkErrorAtom.reportWrite(value, super.checkError, () {
      super.checkError = value;
    });
  }

  late final _$msgAtom =
      Atom(name: '_ClientAuthStoreBase.msg', context: context);

  @override
  String get msg {
    _$msgAtom.reportRead();
    return super.msg;
  }

  @override
  set msg(String value) {
    _$msgAtom.reportWrite(value, super.msg, () {
      super.msg = value;
    });
  }

  late final _$msgErrOrGoalAtom =
      Atom(name: '_ClientAuthStoreBase.msgErrOrGoal', context: context);

  @override
  bool get msgErrOrGoal {
    _$msgErrOrGoalAtom.reportRead();
    return super.msgErrOrGoal;
  }

  @override
  set msgErrOrGoal(bool value) {
    _$msgErrOrGoalAtom.reportWrite(value, super.msgErrOrGoal, () {
      super.msgErrOrGoal = value;
    });
  }

  late final _$supportStateAtom =
      Atom(name: '_ClientAuthStoreBase.supportState', context: context);

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
      Atom(name: '_ClientAuthStoreBase.faceOrFinger', context: context);

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
      Atom(name: '_ClientAuthStoreBase.loginStorage', context: context);

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
      Atom(name: '_ClientAuthStoreBase.canCheckBiometrics', context: context);

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
      Atom(name: '_ClientAuthStoreBase.availableBiometrics', context: context);

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
      Atom(name: '_ClientAuthStoreBase.authorized', context: context);

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
      Atom(name: '_ClientAuthStoreBase.isAuthenticating', context: context);

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

  late final _$_ClientAuthStoreBaseActionController =
      ActionController(name: '_ClientAuthStoreBase', context: context);

  @override
  dynamic setLoading(dynamic value) {
    final _$actionInfo = _$_ClientAuthStoreBaseActionController.startAction(
        name: '_ClientAuthStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_ClientAuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTheme(dynamic value) {
    final _$actionInfo = _$_ClientAuthStoreBaseActionController.startAction(
        name: '_ClientAuthStoreBase.setTheme');
    try {
      return super.setTheme(value);
    } finally {
      _$_ClientAuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic buscaTheme() {
    final _$actionInfo = _$_ClientAuthStoreBaseActionController.startAction(
        name: '_ClientAuthStoreBase.buscaTheme');
    try {
      return super.buscaTheme();
    } finally {
      _$_ClientAuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCode(dynamic value) {
    final _$actionInfo = _$_ClientAuthStoreBaseActionController.startAction(
        name: '_ClientAuthStoreBase.setCode');
    try {
      return super.setCode(value);
    } finally {
      _$_ClientAuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setName(dynamic value) {
    final _$actionInfo = _$_ClientAuthStoreBaseActionController.startAction(
        name: '_ClientAuthStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_ClientAuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(dynamic value) {
    final _$actionInfo = _$_ClientAuthStoreBaseActionController.startAction(
        name: '_ClientAuthStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_ClientAuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(dynamic value) {
    final _$actionInfo = _$_ClientAuthStoreBaseActionController.startAction(
        name: '_ClientAuthStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_ClientAuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setConfirmPassword(dynamic value) {
    final _$actionInfo = _$_ClientAuthStoreBaseActionController.startAction(
        name: '_ClientAuthStoreBase.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$_ClientAuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic cleanVariables() {
    final _$actionInfo = _$_ClientAuthStoreBaseActionController.startAction(
        name: '_ClientAuthStoreBase.cleanVariables');
    try {
      return super.cleanVariables();
    } finally {
      _$_ClientAuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMsg(dynamic value) {
    final _$actionInfo = _$_ClientAuthStoreBaseActionController.startAction(
        name: '_ClientAuthStoreBase.setMsg');
    try {
      return super.setMsg(value);
    } finally {
      _$_ClientAuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMsgErrOrGoal(dynamic value) {
    final _$actionInfo = _$_ClientAuthStoreBaseActionController.startAction(
        name: '_ClientAuthStoreBase.setMsgErrOrGoal');
    try {
      return super.setMsgErrOrGoal(value);
    } finally {
      _$_ClientAuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
theme: ${theme},
code: ${code},
name: ${name},
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword},
checkError: ${checkError},
msg: ${msg},
msgErrOrGoal: ${msgErrOrGoal},
supportState: ${supportState},
faceOrFinger: ${faceOrFinger},
loginStorage: ${loginStorage},
canCheckBiometrics: ${canCheckBiometrics},
availableBiometrics: ${availableBiometrics},
authorized: ${authorized},
isAuthenticating: ${isAuthenticating},
isValidLogin: ${isValidLogin},
isValidSignup: ${isValidSignup},
isValidChangePassword: ${isValidChangePassword},
isValidEmail: ${isValidEmail}
    ''';
  }
}
