import 'package:flutter/material.dart';

class CounterFunctionScreen extends StatefulWidget {
  const CounterFunctionScreen({Key? key}) : super(key: key);

  @override
  State<CounterFunctionScreen> createState() => _CounterFunctionScreenState();
}

class _CounterFunctionScreenState extends State<CounterFunctionScreen> {
  int clicCounter = 0;

  void increaseCounter() {
    setState(() {
      clicCounter++;
    });
  }

  void decreaseCounter() {
    setState(() {
      if (clicCounter > 0) clicCounter--;
    });
  }

  void resetCounter() {
    setState(() {
      clicCounter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Functions'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: resetCounter,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$clicCounter',
              style: TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
            ),
            Text(
              'Clic${clicCounter == 1 ? '' : 's'}',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            icon: Icons.plus_one,
            onPressed: increaseCounter,
          ),
          const SizedBox(height: 10),
          CustomButton(
            icon: Icons.exposure_minus_1,
            onPressed: decreaseCounter,
          ),
          const SizedBox(height: 10),
          CustomButton(
            icon: Icons.refresh_rounded,
            onPressed: resetCounter,
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
