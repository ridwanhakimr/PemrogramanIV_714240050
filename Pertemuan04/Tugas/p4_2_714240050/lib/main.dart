import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Pertemuan 4',
      home: const TengahCuy(),
    );
  }
}

class TengahCuy extends StatelessWidget {
  const TengahCuy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas Pertemuan 4'),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // BOX 1 
            Container(
              width: 280,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                // ujungnya tidak tajam, tapi membulat
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(5, 10), // changes position of shadow
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'Box 1',
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // BOX 2 & BOX 3 (side-by-side)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // BOX 2
                // Kotak kosong, hanya border saja, semua sudut TAJAM.
                Container(
                  width: 128,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.red,
                      width: 5,
                    ),
                    // kotak = semua sudut tajam / siku
                    borderRadius: BorderRadius.zero,
                  ),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Box 2',
                        style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 24),

                // BOX 3
                // Sudut KANAN ATAS & KIRI BAWAH TAJAM (0),
                // sudut KIRI ATAS & KANAN BAWAH TUMPUL (dibulatkan).
                Container(
                  width: 128,
                  height: 180,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: const Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Box 3',
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
