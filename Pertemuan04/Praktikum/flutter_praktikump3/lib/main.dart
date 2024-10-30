import 'package:flutter/material.dart';
import 'package:flutter_praktikump3/material_app.dart';

void main() {
  runApp(AppMaterial());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: const Color.fromARGB(255, 5, 4, 4)),
        borderRadius: BorderRadius.circular(15),
        shape: BoxShape.rectangle,
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            offset: Offset(3, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(30),
      child: const Text(
        'Hi, there! iam using What',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}
