import 'package:flutter_modular/flutter_modular.dart';
import 'package:veacos/app/modules/settings/shared/model/settings_model.dart';
import 'package:veacos/app/modules/settings/shared/repository/interfaces/settings_repository_interfaces.dart';
import 'package:veacos/app/modules/settings/shared/services/interfaces/settings_service_interfaces.dart';

class SettingsService extends Disposable implements ISettingsService {
  final ISettingsRepository settingsRepository;

  SettingsService({required this.settingsRepository});

  @override
  void dispose() {}

  @override
  Future<SettingsModel> show(String id) {
    return settingsRepository.show(id);
  }

  @override
  Future<List<SettingsModel>> index() {
    return settingsRepository.index();
  }

  @override
  Future store(SettingsModel model) {
    return settingsRepository.store(model);
  }

  @override
  Future delete(String id) {
    return settingsRepository.delete(id);
  }
}
