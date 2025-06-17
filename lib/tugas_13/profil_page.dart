// import 'package:flutter/material.dart';
// import 'package:belajar_flutter2/tugas_13/login_page.dart';

// class ProfilPage extends StatelessWidget {
//   final String? email;

//   ProfilPage({this.email});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Profil')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.person, size: 80),
//             SizedBox(height: 10),
//             Text('Email Login:', style: TextStyle(fontSize: 16)),
//             Text(email ?? 'Tidak tersedia', style: TextStyle(fontSize: 20)),
//             SizedBox(height: 20),
//             ElevatedButton(
//               child: Text('Logout'),
//               onPressed: () {
//                 Navigator.pushReplacement(
//                     context, MaterialPageRoute(builder: (_) => TugasTigasBelas()));
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }