// TELA DE CADASTRO

import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Chave de formulário
  //
  // GlobalKey é uma chave que permite acessar um Widget específico
  // e o estado associado a ele.
  //
  // <FormState> informa que esta chave será utilizada para acessar
  // o estado do formulário.
  //
  // O underline no início de _formKey indica, por convenção do Dart,
  // que essa variável é privada para esse arquivo/biblioteca.

  // final significa que a variável não será substituída por outra chave
  // depois de criada.
  final _formKey = GlobalKey<FormState>();

  // Guarda temporariamente a senha digitada
  String _senha = '';

  // Controla se a senha ficará escondida
  bool _ocultarSenha = true;

  // Controla se a confirmação da senha ficará escondida
  bool _ocultarConfirmacao = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),

      // Permite rolar o conteúdo caso o formulário
      // ultrapasse a altura disponível.
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          // Form agrupa os campos que pertencem ao mesmo formulário.
          child: Form(
            // Key conecta este Form ao _formKey criado anteriormente.
            // Assim podemos acessar o FormState e executar as validações.
            key: _formKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Text(
                  'Crie a sua conta',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),

                const Text('Preencha os dados abaixo para continuar'),

                const SizedBox(height: 24),

                // CAMPO NOME
                TextFormField(
                  // Configura a parte visual do campo
                  decoration: const InputDecoration(
                    labelText: 'Nome Completo',
                    // Parecido com o placeholder
                    hintText: 'Digite seu nome',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),

                  // Validator recebe uma função que executa
                  // quando chamarmos validate() no Form.
                  //
                  // value é o valor atual do campo.
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe seu nome';
                    }

                    if (value.trim().length < 3) {
                      return 'Digite pelo menos 3 caracteres.';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // CAMPO E-MAIL
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    hintText: 'tarcisio@gmail.com',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),

                  // Teclado específico para e-mail
                  keyboardType: TextInputType.emailAddress,

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe seu email';
                    }

                    if (!value.contains('@')) {
                      return 'Digite um e-mail válido';
                    }

                    return null;
                  },
                ),

                // CAMPO TELEFONE
                const SizedBox(height: 16),

                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Telefone',
                    hintText: '(11) 90000-0000',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),

                  // Abre o teclado numérico do telefone
                  keyboardType: TextInputType.phone,

                  validator: (value) {
                    // Impede o telefone de ficar vazio
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe seu telefone';
                    }

                    // Remove espaços no começo e no final
                    final telefone = value.trim();

                    // Verifica se possui pelo menos 10 caracteres
                    if (telefone.length < 15) {
                      return 'Digite um telefone válido';
                    }

                    return null;
                  },
                ),

                // CAMPO CIDADE
                const SizedBox(height: 16),

                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Cidade',
                    hintText: 'Sua cidade',
                    prefixIcon: Icon(Icons.home_work_outlined),
                    border: OutlineInputBorder(),
                  ),

                  validator: (value) {
                    // Impede a cidade de ficar vazia
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe sua cidade';
                    }

                    // Remove espaços no começo e no final
                    final cidade = value.trim();

                    // A cidade precisa ter MAIS de 3 caracteres
                    if (cidade.length <= 3) {
                      return 'Digite uma cidade com mais de 3 caracteres';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // CAMPO SENHA
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    hintText: 'Digite sua senha',
                    prefixIcon: const Icon(Icons.lock),
                    border: const OutlineInputBorder(),

                    // Widget exibido no final do campo
                    // para mostrar/esconder a senha.
                    suffixIcon: IconButton(
                      // Operador ternário escolhe qual ícone será exibido
                      icon: Icon(
                        _ocultarSenha ? Icons.visibility : Icons.visibility_off,
                      ),

                      // Executado quando o usuário toca no botão
                      onPressed: () {
                        setState(() {
                          _ocultarSenha = !_ocultarSenha;
                        });
                      },
                    ),
                  ),

                  // true -> esconde os caracteres
                  // false -> mostra os caracteres
                  obscureText: _ocultarSenha,

                  // Chamado a cada alteração no texto do campo
                  onChanged: (value) {
                    // Guardamos a senha para compará-la
                    // posteriormente com a confirmação.
                    _senha = value;
                  },

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe uma senha';
                    }

                    if (value.length < 6) {
                      return 'Use pelo menos 6 caracteres.';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // CAMPO CONFIRMAR SENHA
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Confirmar Senha',
                    hintText: 'Digite sua senha novamente',
                    prefixIcon: const Icon(Icons.lock_outline),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _ocultarConfirmacao
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),

                      onPressed: () {
                        setState(() {
                          _ocultarConfirmacao = !_ocultarConfirmacao;
                        });
                      },
                    ),
                  ),

                  // Controla se os caracteres serão escondidos
                  obscureText: _ocultarConfirmacao,

                  // Validação da confirmação da senha
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Confirme sua senha';
                    }

                    if (value != _senha) {
                      return 'As senhas não coincidem';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 24),

                // BOTÃO CADASTRAR
                SizedBox(
                  // Ocupa todo o espaço disponível
                  width: double.infinity,

                  child: ElevatedButton(
                    onPressed: () {
                      // currentState acessa o estado atual do Form.
                      //
                      // ? executa validate() somente se currentState
                      // não for null.
                      //
                      // ?? false usa false caso o resultado seja null.
                      final formularioValidado =
                          _formKey.currentState?.validate() ?? false;

                      // Se todos os validators retornarem null,
                      // validate() retorna true.
                      if (formularioValidado) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Cadastro validado com sucesso!'),
                          ),
                        );
                      }
                    },

                    child: const Text('Cadastrar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
