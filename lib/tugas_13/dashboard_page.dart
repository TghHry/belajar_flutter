// import 'package:flutter/material.dart';
// import 'package:belajar_flutter2/tugas_13/profil_page.dart';
// import 'package:belajar_flutter2/tugas_13/list_kehadiran.dart';
// import 'package:belajar_flutter2/tugas_13/laporan_kehadiran.dart';

// class DashboardPage extends StatelessWidget {
//   const DashboardPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Dashboard"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ListKehadiranPage(),
//                       ));
//                 },
//                 child: Text("List Kehadiran")),
//             ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => LaporanKehadiranPage(),
//                       ));
//                 },
//                 child: Text("Laporan Kehadiran")),
//             ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ProfilPage(),
//                       ));
//                 },
//                 child: Text("Profil")),
//           ],
//         ),
//       ),
//     );
//   }
// }