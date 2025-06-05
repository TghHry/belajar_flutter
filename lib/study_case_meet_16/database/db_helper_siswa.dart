import 'package:belajar_flutter2/study_case_meet_16/model/siswa_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelperSiswa {
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'siswa.db'), // tambahkan .db agar lebih jelas
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE siswa(id INTEGER PRIMARY KEY AUTOINCREMENT,nama TEXT,umur INTEGER)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertSiswa(Siswa siswa) async {
    final db = await DbHelperSiswa.db(); // perbaikan pemanggilan fungsi
    await db.insert('siswa', siswa.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Siswa>> getAllSiswa() async {
    final db = await DbHelperSiswa.db();
    final List<Map<String, dynamic>> maps = await db.query('siswa');
    return List.generate(
      maps.length,
      (i) => Siswa.fromMap(maps[i]),
    );
  }
}
