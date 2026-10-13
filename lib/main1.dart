import 'package:flutter/material.dart';
import 'package:meu_perfil/screens/catalog_screen.dart';
import 'package:meu_perfil/screens/events_screen.dart';
import 'package:meu_perfil/screens/register_screen.dart';

// import 'package:meu_perfil/screens/perfil_screen.dart';

// FUNÇÃO MAIN
// Nossa função de entrada da aplicação
void main() {
  // Onde inicia a aplicação Flutter
  // Neste projeto, o primeiro widget será o MyApp.
  runApp(const MyApp());
}

// WIDGET PRINCIPAL DA APLICAÇÃO
// Ele extends (herda) StatelessWidget neste momento,
// porque não precisa mudar as informações.
class MyApp extends StatelessWidget {
  // Construtor que usamos quando criamos uma instância dessa classe.
  // key é uma propriedade usada para identificar o widget na árvore.
  const MyApp({super.key});

  // Informar que o método abaixo já existe na classe que estamos usando.
  @override
  // Forma que construímos o nosso widget.
  Widget build(BuildContext context) {
    // MaterialApp é a configuração estrutural geral da aplicação.
    return MaterialApp(
      // Remove a faixa de DEBUG.
      debugShowCheckedModeBanner: false,

      // Título da aplicação.
      title: 'MeuPerfil',

      // Configuração do tema visual.
      theme: ThemeData(
        // colorScheme define o conjunto de cores.
        // fromSeed cria automaticamente um esquema de cores
        // a partir de uma cor base.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),

      // Primeira tela a ser exibida.

      // home: const PerfilScreen(),

      // Nova tela de catálogo.
      // home: const CatalogScreen(),

      // Nova tela de preferências.
      // home: const PreferencesScreen(),

      // Nova tela de registro.
      // home: const RegisterScreen(),

      // Nova tela de eventos.
      home: const EventsScreen(),
    );
  }
}