import 'package:belajar_flutter2/tugas_15/screens/edit_screen.dart';
import 'package:belajar_flutter2/tugas_15/screens/profil_screen.dart';
import 'package:belajar_flutter2/tugas_15/screens/login_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profil App',
      initialRoute: '/profile',
      routes: {
        '/login': (context) =>
            const LoginScreen(), // pastikan LoginScreen sudah ada
        '/profile': (context) => ProfilScreen(),
        '/edit': (context) => EditProfileScreen(),
      },
    );
  }
}
