import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: 100),
            Image.asset(
              "assets/icons/acceso.png",
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.all(48.0),
              child: Text(
                "GROOVE IT",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 200),
            MaterialButton(
              child: Text("Iniciar como anonimo"),
              color: Colors.grey,
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(AnonymousAuthEvent());
              },
            ),
            Text(
              "Utiliza un red social",
            ),
            MaterialButton(
              child: Text("Iniciar con Google"),
              color: Colors.green,
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(GoogleAuthEvent());
              },
            ),
          ],
        ),
      ),
    );
  }
}
