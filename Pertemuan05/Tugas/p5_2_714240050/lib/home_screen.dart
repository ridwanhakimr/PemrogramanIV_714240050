import 'package:flutter/material.dart';
import 'package:projectp5_2_714240050/detail_screen.dart';

// Halaman pertama: menampilkan Card profil singkat
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Data yang akan di-pass ke DetailScreen
    const String nama = 'Ridwan Hakim Ramadhan';
    const String npm = '714240050';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tugas Pertemuan 5',
          style: TextStyle(
            fontFamily: 'MetalMania',
            fontSize: 22,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          color: const Color(0xFF1A1A1A),
          elevation: 12,
          shadowColor: const Color(0xFFB71C1C).withValues(alpha: 0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: Color(0xFF8B0000), width: 1.5),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Foto Profil - ClipRRect untuk sudut rounded
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'images/fotoprofil.webp',
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),

                // Nama Mahasiswa - Custom Font MetalMania
                const Text(
                  nama,
                  style: TextStyle(
                    fontFamily: 'MetalMania',
                    fontSize: 26,
                    color: Color(0xFFFF5252),
                    letterSpacing: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),

                // NPM
                const Text(
                  'NPM: $npm',
                  style: TextStyle(
                    fontFamily: 'MetalMania',
                    fontSize: 18,
                    color: Color(0xFFBDBDBD),
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 28),

                // Tombol navigasi ke DetailScreen (Navigator.push)
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailScreen(
                          nama: nama, // passing data via constructor
                          npm: npm,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB71C1C),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 6,
                    shadowColor: const Color(0xFFFF5252).withValues(alpha: 0.4),
                  ),
                  child: const Text(
                    'Lihat Detail Profil',
                    style: TextStyle(
                      fontFamily: 'MetalMania',
                      fontSize: 18,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
