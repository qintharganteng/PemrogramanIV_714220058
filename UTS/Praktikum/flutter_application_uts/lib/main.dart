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
                    fontSize: 45,
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
                  backgroundColor: const Color.fromARGB(
                      255, 89, 91, 96), // Warna biru menarik
                  foregroundColor:
                      Colors.white, // Warna teks saat tombol ditekan
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  elevation: 5, // Memberikan efek bayangan
                  shadowColor: const Color.fromARGB(
                      255, 132, 135, 139), // Warna bayangan
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50), // Lebih melengkung
                    side: const BorderSide(
                      color: Color.fromARGB(
                          255, 102, 103, 105), // Memberikan outline biru
                      width: 1,
                    ),
                  ),
                ),
                child: const Text(
                  'Start',
                  style: TextStyle(
                    fontFamily: 'Domine', // Font yang sama, terlihat klasik
                    fontSize: 22, // Sedikit lebih besar untuk menonjol
                    fontWeight: FontWeight.bold, // Membuat teks lebih mencolok
                    letterSpacing: 1.2, // Memberikan spasi antar huruf
                    color: Colors.white, // Warna teks putih agar kontras
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
