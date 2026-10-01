// TELA DE PREFERENCIAS

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Nossa tela tera mudanças, por isso escolhemos a opção de StatefulWidget
class  PreferencesScreen  extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override

  // Estamos preparando o widget para ter alteração de estado
  State<PreferencesScreen> createState() => 
  _PreferencesScreenState();
}

// Estado da tela
// A classe State guarda os valores que podem mudar
// e contém o método build() que monta a interface
class _PreferencesScreenState extends State<PreferencesScreen> {

// String está guardando texto com alguns valores já inicial
// Iniciaremos o dropdow
  String temaSelecionado = 'Tecnologia';
  // Essa guarda o valor do Radio selecionado, que começa inicialmento com iniciante
  String nivelSelecionado = 'Iniciante';
  // false significa que a opção começa desmarcada
  bool receberNovidades = false;
  // Começa com false portanto om Switch iniciara desligado
  bool receberNotificacao = false;

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Preferencias'),
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Text(
                  'Configure sua preferencias',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                ),

                SizedBox(height: 24),

                // Os componentes seram adcionados aqui
                const Text(
                  'Seu nome',
                  style:  TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    hintText: 'Digite seu nome',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 24),

              ],
            ),

          ),
        )
      );
  }

}
