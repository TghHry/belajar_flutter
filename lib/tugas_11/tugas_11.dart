import 'package:belajar_flutter2/tugas_11/database_peserta.dart';
import 'package:belajar_flutter2/tugas_11/model_peserta.dart';
// import 'package:belajar_flutter2/meet_7/tugas_7_flutter.dart';
import 'package:flutter/material.dart';

class TugasSebelas extends StatefulWidget {
  const TugasSebelas({super.key});
  static const String id = "/Tugas_Sebelas";

  @override
  State<TugasSebelas> createState() => _TugasSebelasState();
}

class _TugasSebelasState extends State<TugasSebelas> {
  final TextEditingController namacontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController kelascontroller = TextEditingController();
  final TextEditingController asalcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  Future<void> hapusData(int id) async {
    await DbHelperPendaftaran().deletePeserta(id);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data berhasil dihapus')),
    );
    muatData();
  }

  Future<void> ubahData(Peserta peserta) async {
    namacontroller.text = peserta.nama;
    emailcontroller.text = peserta.email;
    kelascontroller.text = peserta.kelas;
    asalcontroller.text = peserta.asal;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Ubah Data"),
          content: Form(
            key: _formkey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                    controller: namacontroller,
                    decoration: InputDecoration(labelText: 'Nama')),
                TextFormField(
                    controller: emailcontroller,
                    decoration: InputDecoration(labelText: 'Email')),
                TextFormField(
                    controller: kelascontroller,
                    decoration: InputDecoration(labelText: 'Kelas')),
                TextFormField(
                    controller: asalcontroller,
                    decoration: InputDecoration(labelText: 'Asal')),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                final updatedPeserta = Peserta(
                  id: peserta.id,
                  nama: namacontroller.text,
                  email: emailcontroller.text,
                  kelas: kelascontroller.text,
                  asal: asalcontroller.text,
                );
                await DbHelperPendaftaran().updatePeserta(updatedPeserta);
                Navigator.pop(context);
                muatData();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Data berhasil diupdate')),
                );
              },
              child: Text("Simpan"),
            ),
          ],
        );
      },
    );
  }

  List<Peserta> daftarPeserta = [];

  @override
  void initState() {
    super.initState();
    muatData();
  }

  Future<void> muatData() async {
    final data = await DbHelperPendaftaran().getAllPeserta();
    setState(() {
      daftarPeserta = data;
    });
  }

  Future<void> simpanData() async {
    if (_formkey.currentState!.validate()) {
      final nama = namacontroller.text;
      final email = emailcontroller.text;
      final kelas = kelascontroller.text;
      final asal = asalcontroller.text;

      await DbHelperPendaftaran().insertPendaftaran(
          Peserta(nama: nama, email: email, kelas: kelas, asal: asal));

      namacontroller.clear();
      emailcontroller.clear();
      kelascontroller.clear();
      asalcontroller.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pendaftaran berhasil disimpan')),
      );

      muatData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD0B8A8),
      appBar: AppBar(
        backgroundColor: Color(0xff8D493A),
        title: Text(
          'Pendaftaran Peserta Kelas',
          style: TextStyle(color: Colors.white),
        ),
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.pushNamed(context, TugasTujuh.id);
        //     },
        //     icon: Icon(Icons.arrow_back_ios_new_outlined)),
        // centerTitle: true,
      ),
      body: Card(
        color: Color(0xffDFD3C3),
        shape: Border(left: BorderSide(color: Colors.black)),
        elevation: 4,
        shadowColor: Colors.black,
        borderOnForeground: true,
        child: Form(
          key: _formkey,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  controller: namacontroller,
                  validator: (value) =>
                      value == null || value.isEmpty ? "Wajib diisi" : null,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: 'Nama',
                      hintText: "Enter your full name"),
                ),
                TextFormField(
                  controller: emailcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Wajib diisi";
                    final emailRegex =
                        RegExp(r'^[\w-\.]+@([\w-]+\.)[\w-]{2,4}$');
                    if (!emailRegex.hasMatch(value)) return "Email tidak valid";
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      hintText: "Enter your email"),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  controller: kelascontroller,
                  validator: (value) =>
                      value == null || value.isEmpty ? "Wajib diisi" : null,
                  decoration: InputDecoration(
                      labelText: 'Nama Kelas',
                      hintText: "Enter your class",
                      prefixIcon: Icon(Icons.class_)),
                  keyboardType: TextInputType.text,
                ),
                TextFormField(
                  validator: (value) =>
                      value == null || value.isEmpty ? "Wajib diisi" : null,
                  controller: asalcontroller,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_city_rounded),
                      labelText: 'Asal Kota',
                      hintText: "Enter your city"),
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: simpanData,
                  label: Text("Simpan"),
                  icon: Icon(Icons.save),
                ),
                Divider(height: 32),
                Expanded(
                    child: ListView.builder(
                  itemCount: daftarPeserta.length,
                  itemBuilder: (context, index) {
                    final siswa = daftarPeserta[index];
                    return Card(
                      color: Colors.white24,
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text(siswa.nama),
                        subtitle: Text(
                            'email: ${siswa.email}\nNama Kelas: ${siswa.kelas}\nAsal Kota : ${siswa.asal}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () => ubahData(siswa),
                                icon: Icon(Icons.edit, color: Colors.orange)),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () => hapusData(siswa.id!),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
