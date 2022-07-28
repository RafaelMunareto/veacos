import 'dart:convert';

class GrupoModel {
  String id;
  String grupo;

  GrupoModel({
    this.id = '',
    this.grupo = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'grupo': grupo,
    };
  }

  factory GrupoModel.fromMap(Map<String, dynamic> map) {
    return GrupoModel(
      id: map['_id'] as String,
      grupo: map['grupo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GrupoModel.fromJson(String source) =>
      GrupoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
