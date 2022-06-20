import 'package:veacos/app/modules/settings/shared/model/grupo_model.dart';
import 'package:veacos/app/shared/auth/model/user_client.model.dart';

class SettingsModel {
  String id;
  String foto;
  GrupoModel? grupo;
  UserClientModel? user;

  SettingsModel({
    this.id = '',
    this.foto = '',
    this.grupo,
    this.user,
  });

  factory SettingsModel.fromDocument(doc) {
    return SettingsModel(
      id: doc['id'],
      foto: doc['foto'],
      grupo: doc['grupo'],
      user: doc['user'],
    );
  }

  factory SettingsModel.fromJson(json) {
    return SettingsModel(
      id: json['id'],
      foto: json['foto'],
      grupo: json['grupo'],
      user: json['user'],
    );
  }

  Map<String, dynamic> toJson() => {};
}
