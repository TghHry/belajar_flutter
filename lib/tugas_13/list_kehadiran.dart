import 'package:flutter/material.dart';
import 'package:belajar_flutter2/tugas_13/tambah_kehadiran.dart';
import 'package:belajar_flutter2/tugas_13/edit_kehadiran_page.dart';
import 'package:belajar_flutter2/tugas_13/database/db_helper.dart';

class ListKehadiranPage extends StatefulWidget {
  @override
  _ListKehadiranPageState createState() => _ListKehadiranPageState();
}

class _ListKehadiranPageState extends State<ListKehadiranPage> {

  Future<List<Map<String, dynamic>>> getData() async {
    final db = await DbHelper.db();
    return await db.query('kehadiran', orderBy: 'tanggal DESC');
  }

  Future<void> _deleteData(int id) async {
    final db = await DbHelper.db();
    await db.delete('kehadiran', where: 'id = ?', whereArgs: [id]);
    setState(() {}); // Refresh UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Kehadiran")),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: getData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          final data = snapshot.data!;
          if (data.isEmpty)
            return Center(child: Text("Belum ada data kehadiran."));
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              return ListTile(
                title: Text(item['nama']),
                subtitle: Text(
                    "${item['keterangan']} (${item['tanggal'].substring(0, 10)})"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => EditKehadiranPage(data: item),
                          ),
                        ).then((_) => setState(() {}));
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteData(item['id']),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TambahKehadiranPage(),
            )).then((_) => setState(() {})), // Refresh after return
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}