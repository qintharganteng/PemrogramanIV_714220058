import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Home - Profile',
            style: TextStyle(
              fontFamily: 'Nabla',
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
          ],
        ),
        body: const ProfilePage(),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 11, 84, 194),
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/fotoqin.jpg'),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Muhammad Qinthar',
                  style: TextStyle(
                    fontFamily: 'Domine',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                const Text(
                  'Developer',
                  style: TextStyle(
                      fontFamily: 'Domine',
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
                const SizedBox(height: 16),

                // Tambahan foto bersebelahan
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'images/ulbi.jpg',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'images/apa.jpg',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            shadowColor: Colors.blueAccent,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.school, color: Colors.blue),
                      const SizedBox(width: 8),
                      const Text(
                        'Kelas',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Domine'),
                      ),
                      Spacer(),
                      const Text(
                        '3B',
                        style:
                            TextStyle(color: Color.fromARGB(255, 81, 82, 82)),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.perm_identity, color: Colors.blue),
                      const SizedBox(width: 8),
                      const Text(
                        'NPM',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontFamily: 'Domine'),
                      ),
                      Spacer(),
                      const Text(
                        '714220058',
                        style:
                            TextStyle(color: Color.fromARGB(255, 83, 83, 84)),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.work_outline, color: Colors.blue),
                      const SizedBox(width: 8),
                      const Text(
                        'Experiences',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontFamily: 'Domine'),
                      ),
                      Spacer(),
                      const Text(
                        '2 Years',
                        style:
                            TextStyle(color: Color.fromARGB(255, 91, 91, 92)),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.book, color: Colors.blue),
                      const SizedBox(width: 8),
                      const Text(
                        'Major',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontFamily: 'Domine'),
                      ),
                      Spacer(),
                      const Text(
                        'D4 - Teknik Informatika',
                        style:
                            TextStyle(color: Color.fromARGB(255, 84, 84, 85)),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.language, color: Colors.blue),
                      const SizedBox(width: 8),
                      const Text(
                        'Language',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontFamily: 'Domine'),
                      ),
                      Spacer(),
                      const Text(
                        'English, Indonesian',
                        style:
                            TextStyle(color: Color.fromARGB(255, 87, 87, 87)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
