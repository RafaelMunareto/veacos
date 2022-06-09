// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ClientStore on _ClientStoreBase, Store {
  late final _$bottomNavigateIndexAtom =
      Atom(name: '_ClientStoreBase.bottomNavigateIndex', context: context);

  @override
  int get bottomNavigateIndex {
    _$bottomNavigateIndexAtom.reportRead();
    return super.bottomNavigateIndex;
  }

  @override
  set bottomNavigateIndex(int value) {
    _$bottomNavigateIndexAtom.reportWrite(value, super.bottomNavigateIndex, () {
      super.bottomNavigateIndex = value;
    });
  }

  late final _$_ClientStoreBaseActionController =
      ActionController(name: '_ClientStoreBase', context: context);

  @override
  dynamic setBottomNavigateIndex(dynamic value) {
    final _$actionInfo = _$_ClientStoreBaseActionController.startAction(
        name: '_ClientStoreBase.setBottomNavigateIndex');
    try {
      return super.setBottomNavigateIndex(value);
    } finally {
      _$_ClientStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bottomNavigateIndex: ${bottomNavigateIndex}
    ''';
  }
}
