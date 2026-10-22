import 'package:flutter/material.dart';

// Halaman kedua: detail profil, deskripsi, quote, dan gallery
class DetailScreen extends StatelessWidget {
  // Data dari HomeScreen diterima via constructor
  final String nama;
  final String npm;

  const DetailScreen({
    super.key,
    required this.nama,
    required this.npm,
  });

  @override
  Widget build(BuildContext context) {
    // Daftar gambar untuk gallery horizontal
    final List<String> galleryImages = [
      'images/gambar1.jpeg',
      'images/gambar2.jpeg',
      'images/gambar3.jpeg',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Profil',
          style: TextStyle(
            fontFamily: 'MetalMania',
            fontSize: 22,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nama & NPM yang di-pass dari HomeScreen
            Center(
              child: Column(
                children: [
                  Text(
                    nama,
                    style: const TextStyle(
                      fontFamily: 'MetalMania',
                      fontSize: 28,
                      color: Color(0xFFFF5252),
                      letterSpacing: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'NPM: $npm',
                    style: const TextStyle(
                      fontFamily: 'MetalMania',
                      fontSize: 18,
                      color: Color(0xFFBDBDBD),
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Divider gradient merah
            Container(
              height: 2,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Color(0xFFB71C1C),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Deskripsi singkat tentang diri
            const Text(
              'Tentang Saya',
              style: TextStyle(
                fontFamily: 'MetalMania',
                fontSize: 22,
                color: Color(0xFFFF5252),
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Seorang manusia dengan hobi sesuai mood aja, kadang nonton film, '
              'membaca, game, dll. Punya banyak minat, terutama dunia informatika.',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFFE0E0E0),
                height: 1.6,
              ),
            ),
            const SizedBox(height: 16),

            // Quote dari Hansen
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF2A0000),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF8B0000), width: 1),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '"Masalah bukan dihadapi dengan kasar, tetapi dihadapi '
                      'dengan sabar. ADIOS."\n— Hansen',
                      style: TextStyle(
                        fontFamily: 'MetalMania',
                        fontSize: 16,
                        color: Color(0xFFFF8A80),
                        fontStyle: FontStyle.italic,
                        height: 1.5,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Gallery Aktivitas - ListView horizontal scroll
            const Text(
              'Gallery Aktivitas',
              style: TextStyle(
                fontFamily: 'MetalMania',
                fontSize: 22,
                color: Color(0xFFFF5252),
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 12),

            // SizedBox membatasi tinggi ListView horizontal
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: galleryImages.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFF8B0000),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFB71C1C).withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    // ClipRRect untuk sudut rounded pada gambar
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        galleryImages[index],
                        width: 260,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 32),

            // Tombol Kembali - OutlinedButton + Navigator.pop
            Center(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFFFF5252),
                  side: const BorderSide(color: Color(0xFFB71C1C), width: 2),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Kembali',
                  style: TextStyle(
                    fontFamily: 'MetalMania',
                    fontSize: 18,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
