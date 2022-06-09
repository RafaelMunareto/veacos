import 'package:mobx/mobx.dart';

part 'forget_store.g.dart';

class ForgetStore = _ForgetStoreBase with _$ForgetStore;
abstract class _ForgetStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}