import 'package:flutter/material.dart';
import 'package:tempo/components/getApi.dart';
import 'package:tempo/pages/clima.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

var request = getApi();

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(labelText: 'Senha'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          Clima(request: request),
                    ));
              },
              child: Text('Login'))
        ]),
      ),
    );
  }
}
