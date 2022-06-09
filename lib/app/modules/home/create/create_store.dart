import 'package:mobx/mobx.dart';

part 'create_store.g.dart';

class CreateStore = _CreateStoreBase with _$CreateStore;
abstract class _CreateStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}