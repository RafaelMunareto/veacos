import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:veacos/app/modules/auth/login/login_store.dart';
import 'package:veacos/app/shared/repositories/localstorage/local_storage_interface.dart';
import 'package:veacos/app/shared/utils/error_model.dart';

class ClientAuthStore {
  ILocalStorage storage = Modular.get();

  var loading$ = ValueNotifier(false);
  setLoading(value) => loading$.value = value;

  var theme$ = ValueNotifier(false);
  setTheme(value) => theme$.value = value;

  buscaTheme() {
    storage.get('theme').then((value) {
      if (value?[0] == 'dark') {
        setTheme(true);
      } else {
        setTheme(false);
      }
    });
  }

  var code$ = ValueNotifier('');
  setCode(value) => code$.value = value;

  var name$ = ValueNotifier('');
  setName(value) => name$.value = value;

  var email$ = ValueNotifier('');
  setEmail(value) => email$.value = value;

  var password$ = ValueNotifier('');
  setPassword(value) => password$.value = value;

  var confirmPassword$ = ValueNotifier('');
  setConfirmPassword(value) => confirmPassword$.value = value;

  cleanVariables() {
    setName('');
    setEmail('');
    setPassword('');
    setCode('');
  }

  var checkError$ = ValueNotifier(false);

  bool get isValidLogin {
    return validateEmail() == null && validatePassword() == null;
  }

  var supportState$ = ValueNotifier(SupportState.unknown);

  var faceOrFinger$ = ValueNotifier(true);

  var loginStorage$ = ValueNotifier([]);

  //biometric
  var canCheckBiometrics$ = ValueNotifier(false);

  var availableBiometrics$ = ValueNotifier([]);

  var authorized$ = ValueNotifier('Não autorizado!');

  var isAuthenticating$ = ValueNotifier(false);

  bool get isValidSignup {
    return validateEmail() == null &&
        validatePassword() == null &&
        validateConfirmPassword() == null &&
        validateName() == null;
  }

  bool get isValidChangePassword {
    return validateConfirmPassword() == null && validatePassword() == null;
  }

  bool get isValidEmail {
    return validateEmail() == null;
  }

  String? validateName() {
    if (name$.value.isEmpty) {
      return 'Campo obrigatório';
    } else if (name$.value.length < 3) {
      return 'Necessário ser maior que 3 caracteres';
    }
    return null;
  }

  String? validateEmail() {
    if (email$.value.isEmpty) {
      return 'Campo obrigatório';
    } else if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email$.value)) {
      return 'Email inválido';
    }
    return null;
  }

  String? validatePassword() {
    if (password$.value.isEmpty) {
      return 'Campo obrigatório';
    } else if (password$.value.length < 6) {
      return 'Necessário ser maior que 6 caracteres';
    }
    return null;
  }

  String? validateConfirmPassword() {
    if (password$.value != confirmPassword$.value) {
      return 'As senhas devem ser iguais.';
    } else if (confirmPassword$.value.isEmpty) {
      return 'Campo obrigatório';
    } else if (confirmPassword$.value.length < 6) {
      return 'Necessário ser maior que 6 caracteres';
    }
    return null;
  }

  var error$ = ValueNotifier('');

  setMessageError(value) {
    try {
      ErrorModel errorModel = ErrorModel.fromMap(value.response.data);
      return 'Erro: ${errorModel.statusCode}, ${errorModel.message}';
    } catch (erro) {
      return 'Erro: ${value.message}';
    }
  }
}
