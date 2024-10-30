import 'package:flutter/material.dart';
import 'package:flutter_praktikump3/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      drawer: Drawer(
        child: ListView(
          children: const [
            ListTile(title: Text('Home Page')),
            ListTile(title: Text('About Page')),
          ],
        ),
      ),
      body: Mytugas(),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
      ]),
    );
  }
}

class Heading extends StatelessWidget {
  final String text;

  const Heading({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class BiggerText extends StatefulWidget {
  final String teks;
  const BiggerText({Key? key, required this.teks, required String text})
      : super(key: key);

  @override
  State<BiggerText> createState() => _BiggerTextState();
}

class _BiggerTextState extends State<BiggerText> {
  double _textSize = 16.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.teks,
          style: TextStyle(fontSize: _textSize),
        ),
        ElevatedButton(
          child: Text(_textSize == 16.00 ? 'Perbesar' : 'Perkecil'),
          onPressed: () {
            setState(() {
              _textSize = _textSize == 16.0 ? 32.0 : 16.0;
            });
          },
        )
      ],
    );
  }
}

class CustomPadding extends StatelessWidget {
  const CustomPadding({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: const Text('Hello World!'),
    );
  }
}

class CustomCenter extends StatelessWidget {
  const CustomCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      child: const Text('Hello World!'),
    );
  }
}

// stl
class CustomColumn extends StatelessWidget {
  const CustomColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Teks 1'),
        SizedBox(height: 20), // Spasi vertikal sebesar 20
        Text('Teks 2'),
      ],
    );
  }
}

class CustomWidgetColumn extends StatelessWidget {
  const CustomWidgetColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Ini Judul',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Text('Universtitas Logistik dan Bisnis Internasional (ULBI)'),
      ],
    );
  }
}

class CustomWidgetRow extends StatelessWidget {
  const CustomWidgetRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(Icons.share),
        Icon(Icons.thumb_up),
        Icon(Icons.thumb_down),
      ],
    );
  }
}

class Mytugas extends StatelessWidget {
  const Mytugas({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('MainAxisAlignment.spaceEvenly'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.share),
            Icon(Icons.thumb_up),
            Icon(Icons.thumb_down),
          ],
        ),
        Padding(padding: const EdgeInsets.all(20)),
        Text('MainAxisAlignment.spaceAround'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.share),
            Icon(Icons.thumb_up),
            Icon(Icons.thumb_down),
          ],
        ),
        Padding(padding: const EdgeInsets.all(20)),
        Text('MainAxisAlignment.spaceBetween'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.share),
            Icon(Icons.thumb_up),
            Icon(Icons.thumb_down),
          ],
        ),
        Padding(padding: const EdgeInsets.all(20)),
        Text('MainAxisAlignment.start'),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.share),
            Icon(Icons.thumb_up),
            Icon(Icons.thumb_down),
          ],
        ),
        Padding(padding: const EdgeInsets.all(20)),
        Text('MainAxisAlignment.center'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.share),
            Icon(Icons.thumb_up),
            Icon(Icons.thumb_down),
          ],
        ),
        Padding(padding: const EdgeInsets.all(20)),
        Text('MainAxisAlignment.end'),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(Icons.share),
            Icon(Icons.thumb_up),
            Icon(Icons.thumb_down),
          ],
        ),
        Padding(padding: const EdgeInsets.all(20)),
      ],
    );
  }
}
