import 'package:mobx/mobx.dart';

part 'meus_calotes_store.g.dart';

class MeusCalotesStore = _MeusCalotesStoreBase with _$MeusCalotesStore;
abstract class _MeusCalotesStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}