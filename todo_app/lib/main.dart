// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Menggunakan warna biru utama
        hintColor: Colors.orange, // Warna aksen untuk tombol
        scaffoldBackgroundColor: Colors.grey[900], // Warna latar belakang gelap
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white), // Teks putih
          bodyMedium:
              TextStyle(color: Colors.white70), // Teks yang lebih terang
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueAccent, // Warna AppBar biru cerah
        ),
      ),
      home: HomePage(),
    );
  }
}
