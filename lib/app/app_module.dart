import 'package:flutter_modular/flutter_modular.dart';
import 'package:local_auth/local_auth.dart';
import 'package:veacos/app/modules/auth/auth_module.dart';
import 'package:veacos/app/modules/home/home_module.dart';
import 'package:veacos/app/shared/auth/auth_controller.dart';
import 'package:veacos/app/shared/auth/repositories/auth_repository.dart';
import 'package:veacos/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:veacos/app/shared/auth/repositories/biometric_repository.dart';
import 'package:veacos/app/shared/auth/repositories/biometric_repository_interface.dart';
import 'package:veacos/app/shared/repositories/localstorage/local_storage_interface.dart';
import 'package:veacos/app/shared/repositories/localstorage/local_storage_share.dart';
import 'package:veacos/app/shared/utils/splash_widget.dart';
import 'package:veacos/app/shared/utils/themes/theme_preferences.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<ILocalStorage>((i) => LocalStorageShare()),
    Bind.instance<LocalAuthentication>(LocalAuthentication()),
    Bind.singleton<ThemePreferences>((i) => ThemePreferences()),
    Bind.singleton<IAuthRepository>((i) => AuthRepository()),
    Bind.singleton<IAuthRepository>((i) => AuthRepository()),
    Bind.singleton<IBiometricRepository>((i) => BiometricRepository()),
    Bind.singleton<AuthController>((i) =>
        AuthController(authRepository: i.get(), biometricRepository: i.get())),
    Bind<ILocalStorage>((i) => LocalStorageShare()),
    Bind.singleton<ThemePreferences>((i) => ThemePreferences())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const SplashWidget()),
    ModuleRoute('/home',
        module: HomeModule(), transition: TransitionType.rightToLeftWithFade),
    ModuleRoute('/auth',
        module: AuthModule(), transition: TransitionType.rightToLeftWithFade),
    ModuleRoute('/settings',
        module: AuthModule(), transition: TransitionType.leftToRightWithFade),
  ];
}
