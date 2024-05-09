import 'package:barbearia/Home.dart';
import 'package:flutter/material.dart';
// Importe sua página home.dart

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white, brightness: Brightness.dark),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Barbearia',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://down-br.img.susercontent.com/file/17b89d92753e6eeeff8c30fe39fc4910',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              child: Text(
                'Seu App para Cortes ',
                style: TextStyle(color: Colors.blue, fontSize: 20.0),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 250, // Defina a largura desejada para o TextField
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Usuário',
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 250, // Defina a largura desejada para o TextField
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Senha',
                ),
              ),
            ),
            SizedBox(height: 20),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  child: const Text(
                    'Entrar',
                  ),
                  onPressed: () {
                    _navigateToHome(
                        context); // Chamar a função de navegação ao pressionar o botão "Entrar"
                  },
                ),
                TextButton(child: const Text('Cadastrar'), onPressed: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Função para navegar para a página home.dart
  void _navigateToHome(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Home())); // Substitua HomeScreen() pelo nome da sua cl
  }
}
