import 'package:belajar_flutter2/study_case_meet_16/database/db_helper_siswa.dart';
import 'package:belajar_flutter2/study_case_meet_16/model/siswa_model.dart';
import 'package:flutter/material.dart';

class SiswaScreen extends StatefulWidget {
  const SiswaScreen({super.key});
  static const String id = "/siswa_screen_app";

  @override
  State<SiswaScreen> createState() => _SiswaScreenState();
}

class _SiswaScreenState extends State<SiswaScreen> {
  final TextEditingController namacontroller = TextEditingController();
  final TextEditingController umurcontroller = TextEditingController();

  List<Siswa> daftarSiswa = [];

  @override
  void initState() {
    super.initState();
    muatData();
  }

  Future<void> muatData() async {
    final data = await DbHelperSiswa().getAllSiswa();
    setState(() {
      daftarSiswa = data;
    });
  }

  Future<void> simpanData() async {
    final nama = namacontroller.text;
    final int umur = int.tryParse(umurcontroller.text) ?? 0;

    if (nama.isNotEmpty && umur > 0) {
      await DbHelperSiswa().insertSiswa(Siswa(nama: nama, umur: umur));
      namacontroller.clear();
      umurcontroller.clear();
      muatData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pendaftaran Siswa'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: namacontroller,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: umurcontroller,
              decoration: InputDecoration(labelText: 'Umur'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: simpanData,
              child: Text("Simpan"),
            ),
            Divider(height: 32),
            Expanded(
                child: ListView.builder(
              itemCount: daftarSiswa.length,
              itemBuilder: (context, index) {
                final siswa = daftarSiswa[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('${siswa.id}'),
                  ),
                  title: Text(siswa.nama),
                  subtitle: Text('Umur: ${siswa.umur}'),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
