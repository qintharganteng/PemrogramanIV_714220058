import 'package:flutter/material.dart';

var iniFontCustom = const TextStyle(fontFamily: 'AntonSC');

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('images/ranca-upas.jpg'),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: const Text(
                  'RANCA UPAS.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'AntonSC',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        const Icon(
                          Icons.calendar_today,
                          color: Color.fromARGB(255, 34, 107, 0),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Open Everyday',
                          style: iniFontCustom,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                          color: Color.fromARGB(255, 34, 107, 0),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          '09:00 - 20:00',
                          style: iniFontCustom,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(
                          Icons.monetization_on,
                          color: Color.fromARGB(255, 34, 107, 0),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Rp 20.000',
                          style: iniFontCustom,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16.0),
                child: const Text(
                  'Ranca Upas adalah sebuah tempat wisata yang berada di kawasan '
                  'Bandung Selatan. Tempat ini sangat cocok untuk kamu yang ingin '
                  'berkemah bersama keluarga atau teman-teman. Di sini kamu bisa '
                  'menikmati keindahan alam Bandung Selatan yang masih asri dan '
                  'sejuk. Selain itu, Ranca Upas juga memiliki fasilitas '
                  'kemah yang bisa kamu gunakan dengan harga yang terjangkau.',
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                            'https://cdn.idntimes.com/content-images/post/20201106/19437160-453398458365585-5644109604204838912-n-c585ba7c280d219489189654315931ac.jpg'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                            'https://cdn.idntimes.com/content-images/post/20201106/34091980-2204188269801480-248274445720879104-n-84408b484e10adec7c35816abaacec28.jpg'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                            'https://cdn.idntimes.com/content-images/post/20201106/39408216-228473327819821-1612494975352700928-n-befa144ceeb67ba9049e6c21964f3034.jpg'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
