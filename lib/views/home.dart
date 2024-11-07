import 'package:flutter/material.dart';
import 'package:sistema_manutencao_carros/views/menu_lateral.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema Manutenção de Carros',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text('Manutenção de Carros'),
        ),
        drawer: const MenuLateral(),
      ),
    );
  }
}
