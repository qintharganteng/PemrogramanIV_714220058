import 'package:flutter/material.dart';
import 'package:p6_1_714220058/bottom_navbar.dart';
import 'package:p6_1_714220058/input_form.dart';
import 'package:p6_1_714220058/input_validator.dart';

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
        useMaterial3: false,
      ),
      home: DynamicBottomNavbar(),
    );
  }
}
