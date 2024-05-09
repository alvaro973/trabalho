import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Usuario {
  String name;
  String email;
  String phoneNumber;

  Usuario({required this.name, required this.email, required this.phoneNumber});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Usuários',
      theme: ThemeData(primaryColor: Colors.white, brightness: Brightness.dark),
      home: UserRegistrationScreen(),
    );
  }
}

class UserRegistrationScreen extends StatefulWidget {
  @override
  _UserRegistrationScreenState createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  List<Usuario> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Usuários'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'E-mail'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'Telefone'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  users.add(
                    Usuario(
                      name: nameController.text,
                      email: emailController.text,
                      phoneNumber: phoneNumberController.text,
                    ),
                  );
                  // Limpa os campos após o cadastro
                  nameController.clear();
                  emailController.clear();
                  phoneNumberController.clear();
                });
              },
              child: Text('Cadastrar'),
            ),
            SizedBox(height: 32.0),
            Text(
              'Usuários Cadastrados:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: users.map((user) {
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text(user.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.email),
                        Text(user.phoneNumber),
                      ],
                    ),
                    onTap: () {
                      // Ação ao tocar no usuário (opcional)
                    },
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
