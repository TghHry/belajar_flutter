import 'package:belajar_flutter2/Meet_11/login_screen.dart';
import 'package:flutter/material.dart';
// import 'package:belajar_flutter2/Meet_11/meet_11.dart';

class TugasSepuluh extends StatefulWidget {
  const TugasSepuluh({super.key});

  @override
  State<TugasSepuluh> createState() => _TugasSepuluhState();
}

class _TugasSepuluhState extends State<TugasSepuluh> {
  final _formkey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _hpController = TextEditingController();
  final _kotaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Formulir Pendaftaran"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
            key: _formkey,
            child: ListView(
              children: [
                TextFormField(
                  controller: _namaController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.person),
                    labelText: ("Nama Lengkap"),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? "Wajib diisi" : null,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: ("Email"),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Wajib diisi";
                    if (!value.contains("@")) return "Email tidak Valid";
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _hpController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    labelText: ("Nomor Handphone"),
                  ),
                ),
                TextFormField(
                  validator: (value) =>
                      value == null || value.isEmpty ? "Wajib diisi" : null,
                  controller: _kotaController,
                  decoration: InputDecoration(
                      labelText: ("Kota Domisili"),
                      prefixIcon: Icon(Icons.location_city)),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: Text("Konfirmasi Data"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // if (_namaController.text.isEmpty)
                                    Text("Nama : ${_namaController.text}"),
                                    Text("Email  : ${_emailController.text}"),
                                    Text("HP      : ${_hpController.text}"),
                                    Text("Kota    : ${_kotaController.text}")
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Kembali")),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ConfirmationPage(
                                                        nama: _namaController
                                                            .text,
                                                        kota: _kotaController
                                                            .text)));
                                      },
                                      child: Text("Lanjut"))
                                ],
                              ));
                    }
                  },
                  child: Text("Daftar"),
                )
              ],
            )),
      ),
    );
  }
}

class ConfirmationPage extends StatelessWidget {
  final String nama;
  final String kota;

  const ConfirmationPage({super.key, required this.nama, required this.kota});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Konfirmasi"),
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              },
              icon: Icon(Icons.arrow_back_ios_new_outlined))),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 200,
              color: Colors.lightGreen,
            ),
            SizedBox(height: 15),
            Center(
              child: Text(
                "Terima Kasih, $nama dari $kota telah mendaftar.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
