import 'package:flutter/material.dart';
import 'package:flutter_application_uts/botton_navbar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assessment Pemrograman Mobile',
      theme: ThemeData.dark(),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'images/background.jpg'), // Path ke gambar background
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Welcome text and button
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    fontFamily: 'Nabla', // Menggunakan font Nabla
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DynamicBottomNavbar(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 194, 195, 197),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontFamily:
                        'Domine', // Menggunakan font Domine untuk tombol
                    fontSize: 20,
                    color: Color.fromARGB(255, 22, 22, 22),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
