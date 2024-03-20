import 'package:flutter/material.dart';
import 'package:groove_it/login.dart';
import 'package:groove_it/providers/login_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<LoginProvider>(
      create: (context) => LoginProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Groove It',
      // theme:
      //     ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)),
      home: Login(),
    );
  }
}
