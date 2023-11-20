import 'package:flutter/material.dart';
import 'package:latihan_responsi/Halaman%20Utama/Halaman_Utama.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white, // Atur warna AppBar secara global
          iconTheme: IconThemeData(
            color: Colors.black, // Ubah warna tombol kembali secara global
          ),
          titleTextStyle: TextStyle(
            color: Colors.black, // Atur warna teks judul AppBar secara global
            fontSize: 20, // Atur ukuran teks judul AppBar secara global
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: halamanUtama(),
    );
  }
}
