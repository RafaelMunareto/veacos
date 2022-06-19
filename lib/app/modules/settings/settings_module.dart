import 'package:veacos/app/modules/settings/settings_page.dart';
import 'package:veacos/app/modules/settings/settings_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:veacos/app/modules/settings/shared/controller/client_settings_store.dart';
import 'package:veacos/app/modules/settings/shared/repository/interfaces/settings_repository_interfaces.dart';
import 'package:veacos/app/modules/settings/shared/repository/settings_repository.dart';
import 'package:veacos/app/modules/settings/shared/services/interfaces/settings_service_interfaces.dart';
import 'package:veacos/app/modules/settings/shared/services/settings_service.dart';
import 'package:veacos/app/shared/auth/repositories/guard.dart';

class SettingsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ClientSettingsStore()),
    Bind.lazySingleton<ISettingsService>(
        (i) => SettingsService(settingsRepository: i.get())),
    Bind.lazySingleton<ISettingsRepository>((i) => SettingsRepository()),
    Bind.lazySingleton((i) => SettingsStore(settingsService: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const SettingsPage(), guards: [AuthGuard()]),
  ];
}
