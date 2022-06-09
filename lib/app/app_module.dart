import 'package:flutter_modular/flutter_modular.dart';
import 'package:veacos/app/modules/home/home_module.dart';
import 'package:veacos/app/shared/repositories/localstorage/local_storage_interface.dart';
import 'package:veacos/app/shared/repositories/localstorage/local_storage_share.dart';
import 'package:veacos/app/shared/utils/splash_widget.dart';
import 'package:veacos/app/shared/utils/themes/theme_preferences.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<ILocalStorage>((i) => LocalStorageShare()),
    Bind.singleton<ThemePreferences>((i) => ThemePreferences()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) => const SplashWidget()),
    ModuleRoute('/home',
        module: HomeModule(), transition: TransitionType.rightToLeftWithFade),
  ];
}
