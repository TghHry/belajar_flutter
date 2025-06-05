import 'package:belajar_flutter2/tugas_11/model_peserta.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelperPendaftaran {
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'peserta.db'), // tambahkan .db agar lebih jelas
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE peserta(id INTEGER PRIMARY KEY AUTOINCREMENT,nama TEXT,email TEXT, kelas TEXT, asal TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertPendaftaran(Peserta peserta) async {
    final db = await DbHelperPendaftaran.db(); // perbaikan pemanggilan fungsi
    await db.insert('peserta', peserta.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Peserta>> getAllPeserta() async {
    final db = await DbHelperPendaftaran.db();
    final List<Map<String, dynamic>> maps = await db.query('peserta');
    return List.generate(
      maps.length,
      (i) => Peserta.fromMap(maps[i]),
    );
  }
}
