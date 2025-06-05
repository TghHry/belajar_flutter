// import 'package:belajar_flutter2/Meet_11/login_screen.dart';
import 'package:belajar_flutter2/meet_12/meet_12a.dart';
import 'package:belajar_flutter2/meet_16/database/register_screen.dart';
import 'package:belajar_flutter2/meet_16/login_screen_tugas_6.dart';
import 'package:belajar_flutter2/meet_2/tugas_2_flutter.dart';
import 'package:belajar_flutter2/meet_3/meet_3a.dart';
import 'package:belajar_flutter2/meet_7/tugas_7_flutter.dart';
import 'package:belajar_flutter2/meet_8/tugas_8_flutter.dart';
import 'package:belajar_flutter2/study_case_meet_16/siswa_screen.dart';
import 'package:belajar_flutter2/tugas_11/tugas_11.dart';
import 'package:belajar_flutter2/utils/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter2/meet_12/meet_12b.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.id,
      // initialRoute: TugasSebelas.id,
      routes: {
        //Harus didaftarkan dulu disini
        "/": (context) => SplashScreen(),
        "/login": (context) => LoginScreenApp(),
        "/meet_2": (context) => TugasDua(),
        MeetTigaA.id: (context) => MeetTigaA(),
        Meet12AInputWidget.id: (context) => Meet12AInputWidget(),
        MeetDuaBelasB.id: (context) => MeetDuaBelasB(),
        TugasDelapan.id: (context) => TugasDelapan(),
        TugasTujuh.id: (context) => TugasTujuh(),
        LoginScreenApp.id: (context) => LoginScreenApp(),
        RegisterScreenApp.id: (context) => RegisterScreenApp(),
        // SiswaScreen.id : (context) => SiswaScreen(),
        TugasSebelas.id: (context) => TugasSebelas(),
      },
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
      // home: TugasEnam(),
    );
  }
}
