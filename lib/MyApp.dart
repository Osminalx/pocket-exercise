import 'package:flutter/material.dart';
import 'package:pocket_exercise/components/AppLayout.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pocket Exercise',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AppLayout(), // Aquí se utiliza AppLayout como la página inicial
    );
  }
}
