
import 'package:belajar_flutter2/tugas_13/model/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';

class DbHelper {
  static Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'ppkd_b_2_db.db'), // tambahkan .db agar lebih jelas
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''7
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            username TEXT,
            email TEXT,
            phone TEXT,
            password TEXT
          )
          ''',
        );
      },
    );
  }

  static Future<void> registerUser({Kehadiran? data}) async {
    final db = await initDB(); // perbaikan pemanggilan fungsi
    await db.insert(
        'users',
        {
          'name': data?.name,
          'username': data?.username,
          'email': data?.email,
          'phone': data?.phone,
          'password': data?.password,
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("User Registrasi Successfull");
  }

  static Future<Kehadiran> login(String email, String password) async {
    final db = await initDB();
    final List<Map<String, dynamic>> data = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (data.isNotEmpty) {
      return Kehadiran.fromMap(data.first);
    } else {
      throw Exception("invalid email or password");
    }
  }
 static Future<List<Kehadiran>> getLaporanPerOrang() async { 
    final db = await DbHelper.db();
    final result = await db.query('kehadiran');
    return result.map((e) => Kehadiran.fromMap(e)).toList();
  }



// class DbHelper {
//   //Kelas Pengelola DataBase
//   static Database?
//       _database; //variabel statis untuk menyimpan koneksi database agar tidak dibuka berulang-ulang

//   static Future<Database> db() async {
//     if (_database != null) return _database!;
//     _database = await _initDb();
//     return _database!;
//   } //Fungsi db() dipakai untuk mengakses database. jika belum dibuat, maka bisa dibuat initdb().

//   static Future<Database> _initDb() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, 'kehadiran.db');


//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) async {
//         await db.execute('''
//           CREATE TABLE kehadiran (
//             id INTEGER PRIMARY KEY AUTOINCREMENT,
//             nama TEXT,
//             tanggal TEXT,
//             waktu TEXT,
//             keterangan TEXT
//           )
//         ''');
//       },
//     );
//   }



 

}

