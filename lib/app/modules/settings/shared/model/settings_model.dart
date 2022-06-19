import 'package:veacos/app/modules/settings/shared/model/grupo_model.dart';
import 'package:veacos/app/shared/auth/model/user_client.model.dart';

class SettingsModel {
  dynamic id;
  String urlImage;
  GrupoModel? grupo;
  UserClientModel? user;

  SettingsModel({
    this.id,
    this.urlImage = '',
    this.grupo,
    this.user,
  });

  factory SettingsModel.fromDocument(doc) {
    return SettingsModel(
      id: doc['id'],
      urlImage: doc['urlImage'],
      grupo: doc['grupo'],
      user: doc['urlImage'],
    );
  }

  factory SettingsModel.fromJson(json) {
    return SettingsModel(
      id: json['id'],
      urlImage: json['urlImage'],
      grupo: json['grupo'],
      user: json['urlImage'],
    );
  }

  Map<String, dynamic> toJson() => {};
}
