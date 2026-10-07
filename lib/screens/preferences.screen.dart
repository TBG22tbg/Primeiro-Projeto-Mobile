// TELA DE PREFERENCIAS

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Nossa tela tera mudanças, por isso escolhemos a opção de StatefulWidget
class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  // Estamos preparando o widget para ter alteração de estado
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

// Estado da tela
// A classe State guarda os valores que podem mudar
// e contém o método build() que monta a interface
class _PreferencesScreenState extends State<PreferencesScreen> {
  // String está guardando texto com alguns valores já inicial
  // Iniciaremos o dropdow
  String temaSelecionado = 'Tecnologia';
  // Essa guarda o valor do Radio selecionado, que começa inicialmento com iniciante
  String nivelSelecionado = 'Ini';
  // false significa que a opção começa desmarcada
  bool receberNovidades = false;
  // Começa com false portanto om Switch iniciara desligado
  bool receberNotificacao = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preferencias')),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Text(
                'Configure sua preferencias',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 24),

              // Os componentes seram adicionados aqui

              // TextField
              const Text(
                'Seu nome',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              // TextField ele cria um campo no qual o usuario pode digitar texto
              TextField(
                // decoration recebe um InputDecoration
                //concentra configurações visuais do campo
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  hintText: 'Digite seu nome',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 24),

              const Text(
                'Tema de interesse',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              // String nada mais é do que informar o tipo de valor usaado no Dropdown
              DropdownButton<String>(
                // representa o valor selecionado agora
                value: temaSelecionado,
                // true ele vai ocupar a largura toda disponivel
                // false usa apenas o espaço nescessario
                isExpanded: true,

                // itens recebe a lista de opções
                items: const [
                  // value -> valor usado internamente
                  // child -> widget a ser exibido

                  DropdownMenuItem(
                    value: 'Tecnologia',
                    child: Text('Tecnologia'),
                  ),

                  DropdownMenuItem(value: 'Jogos', child: Text('Jogos')),
                  DropdownMenuItem(value: 'Design', child: Text('Design')),
                  DropdownMenuItem(value: 'Web', child: Text('Web')),
                  DropdownMenuItem(value: 'Front', child: Text('Front')),
                ],

                // recebe uma função executada quando a seleção muda
                onChanged: (novoValor) {
                  if (novoValor != null) {
                    setState(() {
                      temaSelecionado = novoValor;
                    });
                  }
                },
              ),
              const SizedBox(height: 24),

              // RADIOLISTTILE: value x groupValue
              const Text(
                'Nivel de esperiencia',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              // Usamos para criar um grupo de radio informando que receberá apenas string
              RadioGroup<String>(
                // Carrega o valor que esta selecionado
                groupValue: nivelSelecionado,
                // A função para informar o novo valor selecionado
                onChanged: (novoValor) {
                  if (novoValor != null) {
                    setState(() {
                      nivelSelecionado = novoValor;
                    });
                  }
                },

                // Aqui criamos os radios e os valores
                child: Column(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Ian'),
                        value: 'Ian',
                      ),
                    ),

                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Ivi'),
                        value: 'Ivi',
                      ),
                    ),

                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Ava'),
                        value: 'Ava',
                      ),
                    ),

                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Eva'),
                        value: 'Eva',
                      ),
                    ),

                  ],
                ),
              ),

              const SizedBox(height: 16),

              // CHECKBOXLISTTLETE e valores booleanos
              CheckboxListTile(
                title: const Text('Quero receber novidades'),
                value: receberNovidades,
                onChanged: (novoValor) {
                  setState(() {
                    receberNovidades = novoValor ?? false;
                  });
                },
              ),

              const SizedBox(height: 8),

              // SwitchListTile

              SwitchListTile(
                title: const Text('Ativar notificações'),
                value: receberNotificacao, 
                onChanged: (novoValor) {
                  setState(() {
                    receberNotificacao = novoValor;
                  });
                },
              ),

              const SizedBox(height: 24),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Resumo das preferencias',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),
                    Text('Tema : $temaSelecionado'),
                    Text('Nível : $nivelSelecionado'),
                    Text('novidades:'
                      '${receberNotificacao ? 'Sim' : 'Não'}',
                    ),
                    Text(
                      'Notificações:'
                      '${receberNotificacao ? 'Ativadas' : 'Desativadas'}',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
