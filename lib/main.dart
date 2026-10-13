import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meu_perfil/main1.dart';
import 'package:meu_perfil/screens/aparencia_screen.dart';

void main() {
  runApp(const MyApp());
}

//StatefullWidget permitir escolha de tema
// alterar o MaterialApp enquanto o app esta aberto
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // sytem usa a preferencia de aparencia do aparelho.
  ThemeMode modoAtual = ThemeMode.system;

  void alterarTema(ThemeMode novoModo) {
    setState(() {
      modoAtual = novoModo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // thema  resepresenta a configuração visual clara.
      //ThemeData  agrupa as configurações visuais
      theme: ThemeData(
        // colorSheme ele define a paletas de cores
        // ColorScheme.fromSeed ele gera as paletas apartir de uma cor base
        colorScheme: ColorScheme.fromSeed(
          // ele determina a cor principal da paleta
          seedColor: Colors.indigo,
          // gera as cores adequadas de acordo com o modo (claro ou escuro)
          brightness: Brightness.light,
        ),
      ),

      // darkTheme represneta a configuração visual escura
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
      ),

      // define qual das duas configurações sera usada
      themeMode: modoAtual,

      home: AparenciaScreen(modoAtual: modoAtual, aoAlterarTema: alterarTema),
    );
  }
}