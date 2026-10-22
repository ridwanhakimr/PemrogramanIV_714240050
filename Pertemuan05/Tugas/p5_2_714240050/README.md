# projectp5_2_714240050

Mini Profile Card — Tugas Pertemuan 5 Pemrograman 4

**Nama:** Ridwan Hakim Ramadhan  
**NPM:** 714240050

## Deskripsi

Aplikasi Flutter 2 screen (HomeScreen & DetailScreen) yang memanfaatkan widget Image, Custom Font, ListView, dan Navigation.

## Struktur File

```
lib/
├── main.dart          → Entry point + konfigurasi tema
├── home_screen.dart   → Halaman 1 (Card profil + navigasi)
└── detail_screen.dart → Halaman 2 (Detail + gallery horizontal)
```

## Widget yang Digunakan

- `Image.asset` + `ClipRRect` — gambar dengan sudut rounded
- Custom Font `MetalMania` — didaftarkan di pubspec.yaml
- `ListView.builder` (horizontal) — gallery aktivitas
- `Navigator.push` / `Navigator.pop` — navigasi antar halaman
- `Card`, `ElevatedButton`, `OutlinedButton`

## Cara Menjalankan

```bash
flutter run
```
