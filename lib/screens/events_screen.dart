import 'package:flutter/material.dart';
 
class EventsScreen extends StatefulWidget{
 const EventsScreen({super.key});
 
 @override
 State<EventsScreen> createState() {
  return _EventsScreenState();
 }
}
 
class _EventsScreenState extends State<EventsScreen>{
  String textoDigitado = '';
  String mensagemEnviada = 'Nenhuma mensagem envida';
  String ultimoEvento = 'Nenhuma interação ainda';
  int toques = 0;
  int toquesDuplos = 0;
  int toquesLongos = 0;
 
 //void é uma função que não espera resultados
  void atualizarTexto(String novoTexto){
    setState(() {
      textoDigitado = novoTexto;
      ultimoEvento = 'onChanged: texto alterado';
    });
  }
 
  void enviarMnesagem(String valor) {
    // final impede reatribuir esta varial local
    // trim esta removendo espaços das extremidades
    final mensagem = valor.trim();
 
    setState(() {
      if (mensagem.isEmpty) {
        mensagemEnviada = 'Digite uma mesagem primeiro';
      } else {
        mensagemEnviada = mensagem;
      }
 
      ultimoEvento = 'onSubmitted = envio solicitado';
    });
  }

  void finalizarEdicao() {
    // FocusScope gerencia qual campo esta no foco
    FocusScope.of(context).unfocus();
    //  remove o foco atual
    // normamente faz o teclado virtual desaparecer
    FocusScope.of(context).unfocus();
  }
 

  void registrarToque() {
    setState(() {
      toques++;
      ultimoEvento = 'onTap: Toque simples';
    });
  }

  void registrarToqueDuplo() {
    setState(() {
      toquesDuplos++;
      ultimoEvento = 'onTap: Toque duplo';
    });
  }

  void registrarToqueLongo() {
    setState(() {
      toquesLongos++;
      ultimoEvento = 'onTap: Toque mantido';
    });
  }
  

  // Zerar
  void zerarToques() {
    setState(() {
      toques = 0;
      toquesDuplos = 0;
      toquesLongos = 0;
      ultimoEvento = 'Toques zerados';
    });
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Evento e interações')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
 
          child: Column(
            //stretch amplia os filhos na largura disponivel
            crossAxisAlignment: CrossAxisAlignment.stretch,
 
            children: [
              const Text (
              'Laboratório de interações',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
 
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Digite uma mensagem',
                  hintText: 'Ex: Estou aprendendo flutter',
                  border: OutlineInputBorder(),
                ),
                onChanged: atualizarTexto,

                // Solicita ao teclado a ação visual concluida
                // isso não envia dados ao servidor
                textInputAction: TextInputAction.done,

                // Ao finalizar a entrada, o flutter envia o texto
                // atual como argumento para enviarMnesagem
                onSubmitted: enviarMnesagem,

                // Esse callback não recebe parametro
                // usamos uma função separada para cuidar do foco.
                onEditingComplete: finalizarEdicao,
              ),

 
              const SizedBox(height: 12),
 
              Text('Digitando: $textoDigitado'),
 
              const SizedBox(height: 20),

              GestureDetector(
                onTap: registrarToque,
                onDoubleTap: registrarToqueDuplo,
                onLongPress: registrarToqueLongo,

                child: Container(
                  padding: const EdgeInsets.all(24),

                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: const Text(
                    'Toque, toque duas vezes ou mantenha precionado',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Text('Último evento: $ultimoEvento'),
              const SizedBox(height: 8),

              Text('Toque simples: $toques'),
              Text('Toque duplo: $toquesDuplos'),
              Text('Toque longos: $toquesLongos'),
              

              const SizedBox(height: 12),

              Text('Mensagem enviada: $mensagemEnviada'),

              const SizedBox(height: 20),

              // Novo botão de resetar
               ElevatedButton.icon(
                onPressed: zerarToques, 
                label: const Text('Refresh'),
                icon: Icon(Icons.refresh),
              ),

            ],
          )
        ),
      )
    );
}
  }
 