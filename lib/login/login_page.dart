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
      backgroundColor: Color.fromARGB(255, 225, 208, 255),
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
              child: Center(
                child: Text(
                  "GROOVE-IT",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text("Continue as Guest"),
              color: Colors.white,
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(AnonymousAuthEvent());
              },
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text("Sign in with Google"),
              color: Colors.white,
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
