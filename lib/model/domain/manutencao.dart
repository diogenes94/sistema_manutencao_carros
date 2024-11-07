import 'comentario.dart';

class Manutencao {
  String id;
  String mecanicoId;
  String carroId;
  String descricao;
  List<Comentario> comentarios;

  Manutencao({
    required this.id,
    required this.mecanicoId,
    required this.carroId,
    required this.descricao,
    this.comentarios = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "mecanicoId": mecanicoId,
      "carroId": carroId,
      "descricao": descricao,
      "comentarios": comentarios.map((c) => c.toMap()).toList(),
    };
  }

  factory Manutencao.fromMap(Map<String, dynamic> map) {
    return Manutencao(
      id: map['id'],
      mecanicoId: map['mecanicoId'],
      carroId: map['carroId'],
      descricao: map['descricao'],
      comentarios: (map['comentarios'] as List)
          .map((c) => Comentario.fromMap(c))
          .toList(),
    );
  }
}
