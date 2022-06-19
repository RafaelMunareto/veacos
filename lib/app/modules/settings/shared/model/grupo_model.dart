class GrupoModel {
  String id;
  String grupo;

  GrupoModel({
    this.id = '',
    this.grupo = '',
  });

  factory GrupoModel.fromDocument(doc) {
    return GrupoModel(
      id: doc['id'],
      grupo: doc['grupo'],
    );
  }

  factory GrupoModel.fromJson(json) {
    return GrupoModel(
      id: json['id'],
      grupo: json['grupo'],
    );
  }
  Map<String, dynamic> toJson() => {};
}
