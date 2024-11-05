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
          backgroundColor: const Color.fromARGB(255, 226, 240, 222),
          title: Text('TUGAS PERTEMUAN 4'),
          titleTextStyle: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              height: 70,
              color: const Color.fromARGB(255, 70, 118, 251),
              child: const Center(
                child: Text(
                  'BOX 1',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 100.0, top: 20.0),
                  child: Container(
                    width: 80,
                    height: 200,
                    color: const Color.fromARGB(255, 255, 18, 18),
                    child: const Center(
                      child: Text(
                        'BOX 3',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 100.0, top: 20.0),
                  child: Container(
                    width: 80,
                    height: 200,
                    color: const Color.fromARGB(255, 14, 237, 17),
                    child: const Center(
                      child: Text(
                        'BOX 2',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
