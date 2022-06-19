import 'package:veacos/app/modules/settings/shared/model/settings_model.dart';

abstract class ISettingsRepository {
  Future<SettingsModel> show(String id);
  Future<List<SettingsModel>> index();
  Future store(SettingsModel model);
  Future delete(String id);
}
