import 'package:veacos/app/modules/auth/change/change_module.dart';
import 'package:veacos/app/modules/auth/forget/forget_module.dart';
import 'package:veacos/app/modules/auth/login/login_module.dart';
import 'package:veacos/app/modules/auth/shared/client_auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:veacos/app/modules/auth/signup/signup_module.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ClientAuthStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute,
        module: LoginModule(), transition: TransitionType.rightToLeftWithFade),
    ModuleRoute('/signup',
        module: SignupModule(), transition: TransitionType.leftToRightWithFade),
    ModuleRoute('/forget',
        module: ForgetModule(), transition: TransitionType.leftToRightWithFade),
    ModuleRoute('/change',
        module: ChangeModule(), transition: TransitionType.leftToRightWithFade),
  ];
}
