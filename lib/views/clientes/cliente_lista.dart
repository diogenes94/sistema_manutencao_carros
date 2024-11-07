import 'package:flutter/material.dart';
import 'package:sistema_manutencao_carros/model/domain/cliente.dart';
import 'package:sistema_manutencao_carros/model/service/cliente_service.dart';
import 'package:sistema_manutencao_carros/views/clientes/cliente_cadastro.dart';

class ClienteLista extends StatefulWidget {
  const ClienteLista({super.key});

  @override
  State<ClienteLista> createState() => _ClienteListaState();
}

class _ClienteListaState extends State<ClienteLista> {
  ClienteService clienteService = ClienteService();
  List<Cliente> clientes = [];
  bool loading = false;

  carregarClientes() async {
    setState(() {
      loading = true;
    });
    clientes = await clienteService.buscarTodosClientes();
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    carregarClientes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Clientes Cadastrados'),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                ElevatedButton(
                    onPressed: () async {
                      final result = await Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const ClienteCadastro()),
                      );
                      if (result == true) {
                        // Recarrega a lista de clientes ou exibe uma mensagem de sucesso
                        carregarClientes();
                      }
                    },
                    child: const Text('Cadastrar Cliente')),
                Expanded(
                  child: ListView.builder(
                    itemCount: clientes.length,
                    itemBuilder: (context, index) {
                      var cliente = clientes[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        color: Colors.grey[300],
                        child: ListTile(
                          title: Text(cliente.nome),
                          subtitle: Text(cliente.email),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
