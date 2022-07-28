import 'dart:convert';

import 'package:veacos/app/modules/settings/shared/model/grupo_model.dart';
import 'package:veacos/app/shared/auth/model/user_client.model.dart';
import 'package:veacos/app/shared/utils/dio_struture.dart';

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

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'foto': foto});
    if (grupo != null) {
      result.addAll({'grupo': grupo!.toMap()});
    }
    if (user != null) {
      result.addAll({'user': user!.toMap()});
    }

    return result;
  }

  factory SettingsModel.fromMap(Map<String, dynamic> map) {
    return SettingsModel(
      id: map['id'] ?? '',
      foto: DioStruture().baseUrl + map['foto'],
      grupo: map['grupo'] != null ? GrupoModel.fromMap(map['grupo']) : null,
      user: map['user'] != null ? UserClientModel.fromMap(map['user']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingsModel.fromJson(String source) =>
      SettingsModel.fromMap(json.decode(source));
}
