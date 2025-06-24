import 'package:belajar_flutter2/tugas_15/screens/edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter2/tugas_15/services/api_service.dart';

class ProfilScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfilScreen> {
  bool _isDarkMode = false;
  Future<Map<String, dynamic>>? _userFuture; // Ubah menjadi nullable

  @override
  void initState() {
    super.initState();
    _userFuture = UserService().getProfile();
  }

  void _refreshProfile() {
    setState(() {
      _userFuture = UserService().getProfile(); // Inisialisasi _userFuture
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('My Profile'),
        centerTitle: true,
        leading: Container(),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _userFuture, // Menggunakan _userFuture
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError ||
              !snapshot.hasData ||
              snapshot.data?['data'] == null) {
            return const Center(child: Text("❌ Gagal memuat profil"));
          }

          final user = snapshot.data!['data'];
          final name = user['name'] ?? "Guest";
          final email = user['email'] ?? "email@example.com";

          return ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              Container(
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        'https://picsum.photos/200/300', // Ganti dengan URL gambar profil
                      ),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(email),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      icon: const Icon(Icons.edit,
                          color: Colors.red), // Ganti dengan ikon yang sesuai
                      onPressed: () async {
                        final updated = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => EditProfileScreen(),
                          ),
                        );
                        if (updated == true) {
                          _refreshProfile();
                        }
                      },
                      tooltip:
                          'Edit Profile', // Tooltip untuk memberikan informasi saat hover
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.wallet),
                  SizedBox(width: 10),
                  Text('Payments & appointments',
                      style: TextStyle(fontSize: 16)),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
              SizedBox(height: 10),
              Divider(),
              Text('Settings & Preferences',
                  style: TextStyle(fontSize: 16, color: Colors.grey)),
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Notifications'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: Icon(Icons.language),
                title: Text('Language'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: Icon(Icons.security),
                title: Text('Security'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: Icon(Icons.dark_mode),
                title: Text('Dark mode'),
                trailing: Switch(
                  value: _isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      _isDarkMode = value;
                    });
                  },
                ),
              ),
              Divider(),
              SizedBox(height: 20),
              Text('Support',
                  style: TextStyle(fontSize: 16, color: Colors.grey)),
              ListTile(
                leading: Icon(Icons.question_answer),
                title: Text('Help center'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('About'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final confirm = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Logout"),
                      content: const Text("Apakah kamu yakin ingin logout?"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text("Batal"),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: const Text("Logout",
                              style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                  );
                  if (confirm == true) {
                    await UserService().logout();
                    if (context.mounted) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/login',
                        (route) => false,
                      );
                    }
                  }
                },
                child: Text('Log out'),
                style: ElevatedButton.styleFrom(
                  // primary: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
