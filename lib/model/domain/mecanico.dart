class Mecanico {
  String id;
  String nome;
  String email;

  Mecanico({required this.id, required this.nome, required this.email});

  Map<String, dynamic> toMap() {
    return {"id": id, "nome": nome, "email": email};
  }

  factory Mecanico.fromMap(Map<String, dynamic> map) {
    return Mecanico(id: map['id'], nome: map['nome'], email: map['email']);
  }
}
