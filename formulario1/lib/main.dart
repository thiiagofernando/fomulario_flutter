import 'package:flutter/material.dart';
import 'package:formulario1/formulario_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Text("Cadastro de Compras"),
        ),
        body: const FormularioPage(),
      ),
    );
  }
}
