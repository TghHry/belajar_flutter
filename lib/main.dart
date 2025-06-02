// import 'package:belajar_flutter2/meet_14/meet_14a.dart';
import 'package:belajar_flutter2/meet_14_tugas/my_home_page_tugas.dart';
// import 'package:belajar_flutter2/meet_8/tugas_8_flutter.dart';
// import 'package:belajar_flutter2/meet_ali_7/tugas8.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder()},
        ),
      ),
      home: TugasEmpatBelas(),
    );
  }
}
