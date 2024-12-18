import 'package:flutter/material.dart';
import 'package:flutter_application_p9/bottom_nav_bar.dart';
import 'package:flutter_application_p9/login_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        useMaterial3: false,
      ),
      home: const LoginScreen(),
    );
  }
}
