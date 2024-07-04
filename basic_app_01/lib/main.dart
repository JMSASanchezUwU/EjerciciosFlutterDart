import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Uso de imagen", style: TextStyle(fontSize: 10),),
        ),
        body: Center(
          child: 
            Image.asset('assets/images/cr7.jpg'),
        ),
      ),
    );
  }
}
