// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ClientSettingsStore on _ClientSettingsStoreBase, Store {
  late final _$loadingAtom =
      Atom(name: '_ClientSettingsStoreBase.loading', context: context);

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

  late final _$loadingImagemAtom =
      Atom(name: '_ClientSettingsStoreBase.loadingImagem', context: context);

  @override
  bool get loadingImagem {
    _$loadingImagemAtom.reportRead();
    return super.loadingImagem;
  }

  @override
  set loadingImagem(bool value) {
    _$loadingImagemAtom.reportWrite(value, super.loadingImagem, () {
      super.loadingImagem = value;
    });
  }

  late final _$themeAtom =
      Atom(name: '_ClientSettingsStoreBase.theme', context: context);

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

  late final _$userAtom =
      Atom(name: '_ClientSettingsStoreBase.user', context: context);

  @override
  UserClientModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserClientModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$settingsAtom =
      Atom(name: '_ClientSettingsStoreBase.settings', context: context);

  @override
  SettingsModel get settings {
    _$settingsAtom.reportRead();
    return super.settings;
  }

  @override
  set settings(SettingsModel value) {
    _$settingsAtom.reportWrite(value, super.settings, () {
      super.settings = value;
    });
  }

  late final _$_ClientSettingsStoreBaseActionController =
      ActionController(name: '_ClientSettingsStoreBase', context: context);

  @override
  dynamic setLoading(dynamic value) {
    final _$actionInfo = _$_ClientSettingsStoreBaseActionController.startAction(
        name: '_ClientSettingsStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_ClientSettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoadingImagem(dynamic value) {
    final _$actionInfo = _$_ClientSettingsStoreBaseActionController.startAction(
        name: '_ClientSettingsStoreBase.setLoadingImagem');
    try {
      return super.setLoadingImagem(value);
    } finally {
      _$_ClientSettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTheme(dynamic value) {
    final _$actionInfo = _$_ClientSettingsStoreBaseActionController.startAction(
        name: '_ClientSettingsStoreBase.setTheme');
    try {
      return super.setTheme(value);
    } finally {
      _$_ClientSettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic buscaTheme() {
    final _$actionInfo = _$_ClientSettingsStoreBaseActionController.startAction(
        name: '_ClientSettingsStoreBase.buscaTheme');
    try {
      return super.buscaTheme();
    } finally {
      _$_ClientSettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUser(dynamic value) {
    final _$actionInfo = _$_ClientSettingsStoreBaseActionController.startAction(
        name: '_ClientSettingsStoreBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_ClientSettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSettings(dynamic value) {
    final _$actionInfo = _$_ClientSettingsStoreBaseActionController.startAction(
        name: '_ClientSettingsStoreBase.setSettings');
    try {
      return super.setSettings(value);
    } finally {
      _$_ClientSettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
loadingImagem: ${loadingImagem},
theme: ${theme},
user: ${user},
settings: ${settings}
    ''';
  }
}
