import 'package:flutter/material.dart';
import 'package:meu_perfil/screens/catalog_screen.dart';

// import 'package:meu_perfil/screens/perfil_screen.dart';

//FUNÇÃO MAIN
// Nossa Função de entrada da aplicação
void main() {
  //Onde inicia aplicação flutter
  //Neste projeto, o primeiro widget será o MyApp.
  runApp(const MyApp());
}

// WIDGET PRINCIPAL DA APLICAÇÃO
// Ele extends (herda)  StatelessWidget neste momento, por que  não precisa mudar as informações
class MyApp extends StatelessWidget {
  // Construtor  que usamos quando criamos uma instancia dessa classe
  //key é uma propriedade usada para identificar o widget nna árvore.
  const MyApp({super.key});

  // Informar que o método abaixo já existe, na classe que estamos usando
  @override
  // Forma que biuldamos o nosso widget
  Widget build(BuildContext context) {
    // MaterialApp é a configuração estrutural geral  da aplicação.
    return MaterialApp(
      //Remove a faixa de DEBUG.
      debugShowCheckedModeBanner: false,
      // Titulo da Aplicação
      title: 'MeuPerfil',

      // Configuração do thema visual
      theme: ThemeData(
        // colorSheme define o conjunto de cores
        // fromSeed cia automaticamente um esquema de cores a partir de uma cor base
        // seeColor é uma cor utilizada como base  para gerar o esquema
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      //Primeira tela ser exibida
      // home: const PerfilScreen(),

      // Nova tela de catalogo
      home: const CatalogScreen(),
    );
  }
}