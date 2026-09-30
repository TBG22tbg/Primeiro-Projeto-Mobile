// Tela de Catalogo

import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  // dados do nosso catalogo
  // List<String> Siginifica:
  // List -> uma coleção de valores;
  // String -> é que cada valor sera guardado em formato de texto;
  final List<String> produtos = const [
    'Notebook',
    'Celular',
    'Headset',
    'Teclado',
    'Mouse',
    'Monitor',
    'Impressora',
    'Tablet',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catalogo')),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Produtos em destaque',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),
            // A listview sera adicionada aqui

            SizedBox(
              // Como a nossa listview sera horizontal, precisamos reservas uma altura para essa aerea, que ela podera ocupar
              height: 120,

              child: ListView.builder(
                // Por padrão, a listview rola verticalmente
                //Axis.horizontal muda a direção da rolagem
                scrollDirection: Axis.horizontal,

                // Define quantos itens a listview irá contruir
                itemCount: produtos.length,

                //descreve como cada item sera montado
                itemBuilder: (context, index) {
                  return Container(
                    width: 150,
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.all(12),

                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade50,
                      borderRadius: BorderRadius.circular(12),

                      // NOVA APARÊNCIA DO CARD
                      border: Border.all(
                        color: Colors.blueGrey,
                        width: 1,
                      ),

                      // SOMBRA DO CARD
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 5,
                          offset: Offset(0, 5),
                          spreadRadius: 0,
                        ),
                      ],
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star,
                          size: 32,
                        ),

                        const SizedBox(height: 8),

                        Text(
                          // Index indical qual a posição esta sendo contruida
                          produtos[index],
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Todos os Produto',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 24),

            // Nossa GridView sera adicionada aqui
            //Expanded utiliza o espaço que ainda estiver disponivel dentro da column.
            // A parte superiro da tela ja possui o titulo ListView.
            // O gridview pode ocupar o restante.
            Expanded(
              child: GridView.builder(
                itemCount: produtos.length,

                // Em uma gridview vertical
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  // representa a quantidade de coluna
                  crossAxisCount: 2,

                  //espaço horizontal entre as colunas
                  crossAxisSpacing: 12,

                  //  espaço vertical entre as linhas
                  mainAxisSpacing: 12,

                  //controla a porporção largura x altura
                  childAspectRatio: 1.2,
                ),

                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(12),

                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade50,
                      borderRadius: BorderRadius.circular(12),

                      // NOVA BORDA
                      border: Border.all(
                        color: Colors.blueGrey,
                        width: 1,
                      ),

                      // NOVA SOMBRA
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 6,
                          offset: Offset(0, 3),
                          spreadRadius: 1,
                        ),
                      ],
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.shopping_bag,
                          size: 40,
                        ),

                        const SizedBox(height: 8),

                        Text(
                          produtos[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}