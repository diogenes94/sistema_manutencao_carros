import 'package:flutter/material.dart';
import 'package:sistema_manutencao_carros/views/clientes/cliente_lista.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Text('Menu'),
          ),
          ListTile(
            title: const Text("Cadastro Clientes"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ClienteLista()),
              );
            },
          )
        ],
      ),
    );
  }
}
