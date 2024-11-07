class Comentario {
  String id;
  String autorId;
  String texto;
  DateTime data;

  Comentario({
    required this.id,
    required this.autorId,
    required this.texto,
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "autorId": autorId,
      "texto": texto,
      "data": data.toIso8601String(),
    };
  }

  factory Comentario.fromMap(Map<String, dynamic> map) {
    return Comentario(
      id: map['id'],
      autorId: map['autorId'],
      texto: map['texto'],
      data: DateTime.parse(map['data']),
    );
  }
}
