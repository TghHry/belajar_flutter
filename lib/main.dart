import 'package:belajar_flutter2/Meet_11/login_screen.dart';
import 'package:belajar_flutter2/meet_12/meet_12a.dart';
// import 'package:belajar_flutter2/meet_2/contoh_contoh2.dart';
import 'package:belajar_flutter2/meet_2/tugas_2_flutter.dart';
import 'package:belajar_flutter2/meet_3/meet_3a.dart';
import 'package:belajar_flutter2/meet_7/tugas_7_flutter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: "/",
      // routes: {
      //   //Harus didaftarkan dulu disini
      //   "/": (context) => LoginScreen(),
      //   "/meet_2": (context) => TugasDua(),
      //   MeetTigaA.id: (context) => MeetTigaA(),
      // },
      debugShowCheckedModeBanner: false,
      title: 'PPKD B 2',

      theme: ThemeData(
        // useMaterial3: true,
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder()},
        ),
      ),
      home:TugasTujuh() ,
    );
  }
}
