import 'package:flutter/material.dart';
import 'package:meu_perfil/widgets/info_cards.dart';

//TELA DE PERFIL

//Essa classe representa a tela de perfil do aplicativo
class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold quem vai fornecer a estrutura visual basica da tela.
    return Scaffold(
      //Barra superior da tela
      appBar: AppBar(title: const Text('Meu Perfil'), centerTitle: true),

      // conteudo principal
      // body: const Center(child: Text('Tela de Perfil!')),
      // SingleChildScrollView > Rolagem do scroll
      body: SingleChildScrollView(
        child: Padding(
          //Criando um espaço interno ao redor do conteudo.
          padding: EdgeInsets.all(24),
          //Coluna para organizar seus filhos verticalmente
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar circular do perfil
              // CircleAvatar(radius: 55, child: Icon(Icons.person, size: 65)),
              const CircleAvatar(
                radius: 55,
                backgroundImage: NetworkImage(
                  'https://lh3.googleusercontent.com/a/ACg8ocJ7DAb-cuSUzgtMLaChNoPBrfzZ08F7jD_7rNZsWgWuwLpKS7eT=s288-c-no',
                ),
              ),


              // Criar um espaço vertical
              SizedBox(height: 20),

              //Primeiro texto da coluna
              // Nome usuario
              Text(
                'Tharcísio Gonçalves',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              //segundo texto da coluna
              Text(
                'Desenvolvedor Mobile',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              SizedBox(height: 30),

              // Container Email
              // Container(
              //   // Faz com que o container ocupa toda a largura disponivel
              //   width: double.infinity,
              //   // Espaçamento interno
              //   padding: const EdgeInsets.all(16),
              //   decoration: BoxDecoration(
              //     color: Colors.deepPurple.shade50,
              //     borderRadius: BorderRadius.circular(12),
              //   ),

              //   child: Row(
              //     children: [
              //       Icon((Icons.email)),
              //       SizedBox(width: 12),
              //       Text('tarcisio@gmail.com'),
              //     ],
              //   ),
              // ),

              // Container Telefone
              SizedBox(height: 10),

              // Container(
              //   // Faz com que o container ocupa toda a largura disponivel
              //   width: double.infinity,
              //   // Espaçamento interno
              //   padding: const EdgeInsets.all(16),
              //   decoration: BoxDecoration(
              //     color: const Color.fromARGB(255, 180, 155, 218),
              //     borderRadius: BorderRadius.circular(12),
              //   ),

              //   child: Row(
              //     children: [
              //       Icon(Icons.phone, color:Color.fromARGB(255, 243, 243, 243)),
              //       SizedBox(width: 12),
              //       Text('(11) 95838-9497'),
              //     ],
              //   ),
              // ),
              const InfoCard(icon: Icons.email, text: 'tarcisio@gmail.com'),

              SizedBox(height: 10),
              const InfoCard(icon: Icons.phone, text: '(11) 95839-9497'),

              SizedBox(height: 10),
              const InfoCard(icon: Icons.location_on, text: 'São Paulo - SP'),

              // Container Tecnologias
              SizedBox(height: 10),

              const Text(
                'Tecnologias',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 15),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 73, 57, 99),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  // Distribuir os elementos entre os espaços disponiveis
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text('Flutter'), Text('Mobile'), Text('FireBase')],
                ),
              ),


              // Novo container

              SizedBox(height: 10),

              const Text(
                'Front-End',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 15),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 73, 57, 99),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  // Distribuir os elementos entre os espaços disponiveis
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text('HTML'), Text('CSS'), Text('JavaScript')],
                ),
              ),

              // Botão Editar
              const SizedBox(height: 35),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Botão Editar perfil precionado!'),
                      ),
                    );
                  },

                  child: const Text('Editar Perfil'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
