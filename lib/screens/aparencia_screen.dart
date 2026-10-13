import 'package:flutter/material.dart';
 
class AparenciaScreen extends StatelessWidget {
  const AparenciaScreen({
    super.key,
    required this.modoAtual,
    required this.aoAlterarTema,
  });
 
  //final: referencia definida no construtor
  // modo selecionado e enviado pelo MyApp
  final ThemeMode modoAtual;
 
  //callback: recebe o themeMode e retorna void
  final void Function(ThemeMode) aoAlterarTema;
 
  @override
  Widget build(BuildContext context) {
    //Theme.of(Context) le o tema ativo nessa tela
    final cores = Theme.of(context).colorScheme;
 
    return Scaffold(
      appBar: AppBar(title: const Text('Aparencia')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Escolha o tema de aplicativo',
                style: TextStyle(fontSize: 22),
              ),
 
              const SizedBox(height: 16),
              //Cada Botão compara o modo atual e envia a escolha pelo callback
              SegmentedButton<ThemeMode>(
                segments: const [
                  ButtonSegment(value: ThemeMode.system, label: Text('Sistema')),
                  ButtonSegment(value: ThemeMode.light, label: Text('Claro')),
                  ButtonSegment(value: ThemeMode.dark, label: Text('Escuro')),
                ],
                selected: {modoAtual},
                onSelectionChanged: (novosModos) {
                  // o conjunto tem uma opção selecionada
                  aoAlterarTema(novosModos.first);
                },
              ),
 
              const SizedBox(height: 24),
 
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: cores.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Este cartão acompanha o tema',
                  style: TextStyle(color: cores.onPrimaryContainer),
                ),
              ),
 
              const SizedBox(height: 16),
 
              const FilledButton(
                onPressed: null,
                child: Text('Botão de exemplo'),
              ),
 
              const SizedBox(height: 16),
 
              Text(
                'Modo selecionado: ${modoAtual.name}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 