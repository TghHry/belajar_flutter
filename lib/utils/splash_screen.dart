// // import 'package:belajar_flutter2/study_case_meet_16/siswa_screen.dart';
// // import 'package:belajar_flutter2/meet_7/tugas_7_flutter.dart';
// // import 'package:belajar_flutter2/meet_8/tugas_8_flutter.dart';
// import 'package:belajar_flutter2/meet_8/tugas_8_flutter.dart';
// import 'package:belajar_flutter2/tugas_11_12/tugas_11.dart';
// import 'package:flutter/material.dart';
// import 'package:belajar_flutter2/constant/app_image.dart';
// import 'package:belajar_flutter2/constant/app_style.dart';
// // import 'package:belajar_flutter2/tugas_11/tugas_11.dart';
// import 'package:belajar_flutter2/helper/preference.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//   static const String id = "/splashScreen";

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   void changePage() {
//     Future.delayed(Duration(seconds: 3), () async {
//       bool isLogin = await PreferenceHandler.getLogin();
//       // print("isLogin: $isLogin");
//       // if (isLogin) {
//       //   return Navigator.pushNamedAndRemoveUntil(
//       //     context,
//       //     MeetDuaBelasB.id,
//       //     (route) => false,
//       //   );
//       // } else {
//       //   Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
//       // }
//       // Navigator.pushNamedAndRemoveUntil(
//       //   context,
//       //   TugasDelapan.id,
//       //   (route) => false,
//       // );
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => TugasDelapan(),
//           ));
//     });
//   }

//   @override
//   void initState() {
//     changePage();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF001F54),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Spacer(),
//             Image.asset(AppImage.belanja, height: 200),
//             SizedBox(height: 20),
//             Text(
//               "My Goals App",
//               style: TextStyle(
//                   fontSize: 30,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold),
//             ),
//             Spacer(),
//             SafeArea(
//               child: Text("v 1.0.0", style: AppStyle.fontRegular(fontSize: 10)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
