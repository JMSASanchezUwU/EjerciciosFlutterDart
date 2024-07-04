import 'package:cegd_hola_mundo/Screens/counter/counter_functions_screen.dart';
import 'package:cegd_hola_mundo/Screens/counter/counter_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const CounterFunctionScreen(),
    );
  }
}
