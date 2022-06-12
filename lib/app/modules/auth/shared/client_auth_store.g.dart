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
  String toString() {
    return '''
loading: ${loading},
theme: ${theme},
name: ${name},
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword},
isValidLogin: ${isValidLogin},
isValidSignup: ${isValidSignup},
isValidChangePassword: ${isValidChangePassword},
isValidEmail: ${isValidEmail}
    ''';
  }
}
