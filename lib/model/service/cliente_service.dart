import 'dart:convert';

import 'package:sistema_manutencao_carros/config/constants.dart';
import 'package:sistema_manutencao_carros/model/domain/cliente.dart';
import 'package:http/http.dart' as http;

class ClienteService {
  Future<void> adicionarCliente(Cliente cliente) async {
    const url = "${Constants.urlCliente}.json";
    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: json.encode(cliente.toMap()),
    );

    if (response.statusCode != 200) {
      print("Falha ao salvar");
    }
  }

  Future<List<Cliente>> buscarTodosClientes() async {
    const url = "${Constants.urlCliente}.json";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final clientesResult = json.decode(response.body);
      if (clientesResult != null && clientesResult is Map<String, dynamic>) {
        final List<Cliente> clientes = clientesResult.entries
            .map(
                (entry) => Cliente.fromMap(entry.value as Map<String, dynamic>))
            .toList();
        return clientes;
      }
    }
    return [];
  }
}
