import 'package:flutter/material.dart';
import 'package:projectp5_2_714240050/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Profile Card',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0A0A),
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFFB71C1C),
          secondary: const Color(0xFFD32F2F),
          surface: const Color(0xFF1A1A1A),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1A0000),
          foregroundColor: Color(0xFFFF5252),
          elevation: 4,
        ),
        fontFamily: 'MetalMania',
      ),
      home: const HomeScreen(),
    );
  }
}
