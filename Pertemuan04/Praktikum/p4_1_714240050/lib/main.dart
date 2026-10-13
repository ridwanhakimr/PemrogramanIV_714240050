import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tempat Wisata Bandung',
      home: const DetailScreen()
      );
      
  }
}

class DetailScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin : const EdgeInsets.only(top: 16.0),
              child: const Text(
                'Ranca Upas',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: const[
                          Icon(Icons.calendar_today),
                          SizedBox(height: 8.0),
                          Text('Open Everyday'),
                        ],
                      ),
                      Column(
                        children: const[
                          Icon(Icons.access_time),
                          SizedBox(height: 8.0),
                          Text('09:00 - 20:00'),
                        ],
                      ),
                      Column(
                        children: const[
                          Icon(Icons.monetization_on),
                          SizedBox(height: 8.0),
                          Text('Rp 20.000'),
                        ],
                      )
                    ]
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Ranca Upas adalah sebuah tempat wisata alam yang terletak di daerah Ciwidey, Bandung, Jawa Barat. Tempat ini terkenal dengan keindahan alamnya yang memukau, termasuk hutan pinus, danau, dan area camping. Ranca Upas juga dikenal sebagai tempat konservasi rusa, sehingga pengunjung dapat berinteraksi dengan rusa-rusa yang jinak. Selain itu, terdapat berbagai fasilitas rekreasi seperti kolam renang alami, outbound, dan area bermain anak-anak.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
