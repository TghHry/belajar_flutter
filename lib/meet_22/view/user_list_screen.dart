// import 'package:belajar_flutter2/meet_22/api/get_user.dart';
// import 'package:flutter/material.dart';
// import 'package:belajar_flutter2/meet_22/model/user_model.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: UserListScreen(),
//     );
//   }
// }

// class UserListScreen extends StatefulWidget {
//   const UserListScreen({Key? key}) : super(key: key); 
//   @override
//   State<UserListScreen> createState() => _UserListScreenState();
// }



// class _UserListScreenState extends State<UserListScreen> {
//  // Perbaiki constructor
//   List<fetchUsers> _fetchUserss = [];
//   List<fetchUsers> _filteredfetchUserss = [];
//   bool _isLoading = true;
//   String _searchQuery = '';

//   @override
//   void initState() {
//     super.initState();
//     _fetchfetchUserss();
//   }

//   Future<void> _fetchfetchUserss() async {
//     try {
//       final fetchUserss = await fetchfetchUserss();
//       setState(() {
//         _fetchUserss = fetchUserss;
//         _filteredfetchUserss = fetchUserss; // Inisialisasi daftar fetchUsers yang difilter
//         _isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//       // Tangani kesalahan di sini jika diperlukan
//     }
//   }

//   void _filterfetchUserss(String query) {
//     setState(() {
//       _searchQuery = query;
//       if (query.isEmpty) {
//         _filteredfetchUserss = _fetchUserss; // Kembali ke daftar lengkap jika query kosong
//       } else {
//         _filteredfetchUserss = _fetchUserss.where((fetchUsers) {
//           return fetchUsers.title!.toLowerCase().contains(query.toLowerCase());
//         }).toList(); // Filter daftar fetchUsers berdasarkan judul
//       }
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Tambahkan Scaffold untuk struktur dasar
//       appBar: AppBar(
//         title: const Text('User List'), // Tambahkan judul
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             // Gunakan Expanded agar ListView mengisi sisa ruang
//             child: FutureBuilder<List<Users>>(
//               // Tentukan tipe data FutureBuilder
//               future: _fetchUserss,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(
//                       child: CircularProgressIndicator()); // Tambahkan const
//                 } else if (snapshot.hasError) {
//                   // Tambahkan penanganan error
//                   return Center(child: Text("Error: ${snapshot.error}"));
//                 } else if (snapshot.hasData) {
//                   final users = snapshot.data;
//                   return ListView.builder(
//                     // shrinkWrap: true, // Hapus karena sudah ada Expanded
//                     itemCount: users?.length ?? 0,
//                     itemBuilder: (BuildContext context, int index) {
//                       final user = users?[index];
//                       return ListTile(
//                         title: Text("${user?.firstName} ${user?.lastName}"),
//                         subtitle: Row(
//                           children: [
//                             Text("${user?.email}"),
//                             Spacer(),
//                             Text("${user?.id}"),
//                           ],
//                         ),
//                         leading: CircleAvatar(
//                           backgroundImage: NetworkImage(user?.avatar ?? ""),
//                         ),
//                       );
//                     },
//                   );
//                 } else {
//                   return const Text(
//                       "No data available"); // Tambahkan kasus jika tidak ada data
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
