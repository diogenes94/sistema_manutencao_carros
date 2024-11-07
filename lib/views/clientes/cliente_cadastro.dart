import 'package:flutter/material.dart';
import 'package:sistema_manutencao_carros/model/domain/cliente.dart';
import 'package:sistema_manutencao_carros/model/service/cliente_service.dart';

class ClienteCadastro extends StatefulWidget {
  const ClienteCadastro({super.key});

  @override
  State<ClienteCadastro> createState() => _ClienteCadastroState();
}

class _ClienteCadastroState extends State<ClienteCadastro> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  ClienteService clienteService = ClienteService();

  Future<void> _salvarCliente() async {
    if (_formKey.currentState!.validate()) {
      final cliente = Cliente(
        id: DateTime.now()
            .toString(), // Substituir por um gerador de ID apropriado
        nome: _nomeController.text,
        email: _emailController.text,
      );
      await clienteService.adicionarCliente(cliente);
      Navigator.pop(context, true); // Retorna à lista de clientes
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o email';
                  }
                  if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value)) {
                    return 'Por favor, insira um email válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _salvarCliente,
                child: const Text('Salvar Cliente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
