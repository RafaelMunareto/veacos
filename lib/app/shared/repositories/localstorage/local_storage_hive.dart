import 'dart:async';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'local_storage_interface.dart';

class LocalStorageHive implements ILocalStorage {
  final Completer<Box> _instance = Completer<Box>();

  _init() async {
    if (!kIsWeb) {
      var dir = await getApplicationDocumentsDirectory();
      Hive.init(dir.path);
      var box = await Hive.openBox('db');
      _instance.complete(box);
    }
  }

  LocalStorageHive() {
    _init();
  }

  @override
  Future delete(String key) async {
    var box = await _instance.future;
    box.delete(key);
  }

  @override
  Future<List<String>> get(String key) async {
    var box = await _instance.future;
    return box.get(key);
  }

  @override
  Future put(String key, value) async {
    var box = await _instance.future;
    box.put(key, value);
  }

  @override
  Future putObject(String key, value) async {
    var box = await _instance.future;
    box.put(key, value);
  }
}
