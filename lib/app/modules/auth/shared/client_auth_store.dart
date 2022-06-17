import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:veacos/app/shared/repositories/localstorage/local_storage_interface.dart';

part 'client_auth_store.g.dart';

class ClientAuthStore = _ClientAuthStoreBase with _$ClientAuthStore;

abstract class _ClientAuthStoreBase with Store {
  ILocalStorage storage = Modular.get();

  @observable
  bool loading = false;

  @action
  setLoading(value) => loading = value;

  @observable
  bool theme = false;

  @action
  setTheme(value) => theme = value;

  @action
  buscaTheme() {
    storage.get('theme').then((value) {
      if (value?[0] == 'dark') {
        setTheme(true);
      } else {
        setTheme(false);
      }
    });
  }

  @observable
  String code = '';

  @action
  setCode(value) => code = value;

  @observable
  String name = '';

  @action
  setName(value) => name = value;

  @observable
  String email = '';

  @action
  setEmail(value) => email = value;

  @observable
  String password = '';

  @action
  setPassword(value) => password = value;

  @observable
  String confirmPassword = '';

  @action
  setConfirmPassword(value) => confirmPassword = value;

  @action
  cleanVariables() {
    setName('');
    setEmail('');
    setPassword('');
  }

  @observable
  bool checkError = false;

  @observable
  String msg = '';

  @action
  setMsg(value) => msg = value;

  @observable
  bool msgErrOrGoal = false;

  @computed
  bool get isValidLogin {
    return validateEmail() == null && validatePassword() == null;
  }

  @action
  setMsgErrOrGoal(value) => msgErrOrGoal = value;

  @computed
  bool get isValidSignup {
    return validateEmail() == null &&
        validatePassword() == null &&
        validateConfirmPassword() == null &&
        validateName() == null;
  }

  @computed
  bool get isValidChangePassword {
    return validateConfirmPassword() == null && validatePassword() == null;
  }

  @computed
  bool get isValidEmail {
    return validateEmail() == null;
  }

  String? validateName() {
    if (name.isEmpty) {
      return 'Campo obrigatório';
    } else if (name.length < 3) {
      return 'Necessário ser maior que 3 caracteres';
    }
    return null;
  }

  String? validateEmail() {
    if (email.isEmpty) {
      return 'Campo obrigatório';
    } else if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email)) {
      return 'Email inválido';
    }
    return null;
  }

  String? validatePassword() {
    if (password.isEmpty) {
      return 'Campo obrigatório';
    } else if (password.length < 6) {
      return 'Necessário ser maior que 6 caracteres';
    }
    return null;
  }

  String? validateConfirmPassword() {
    if (password != confirmPassword) {
      return 'As senhas devem ser iguais.';
    } else if (confirmPassword.isEmpty) {
      return 'Campo obrigatório';
    } else if (confirmPassword.length < 6) {
      return 'Necessário ser maior que 6 caracteres';
    }
    return null;
  }
}
