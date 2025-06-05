import 'package:belajar_flutter2/meet_16/model/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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

  // static Future<void> registerUser(
  //   String name,
  //   String username,
  //   String email,
  //   String phone,
  //   String password,
  // ) async {
  //   final db = await initDB(); // perbaikan pemanggilan fungsi

  //   await db.insert(
  //       'users',
  //       {
  //         'name': name,
  //         'username': username,
  //         'email': email,
  //         'phone': phone,
  //         'password': password,
  //       },
  //       conflictAlgorithm: ConflictAlgorithm.replace);
  //   print("User Registrasi Successfull");
  // }

  static Future<void> registerUser({UserModel? data}) async {
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

  static Future<UserModel> login(String email, String password) async {
    final db = await initDB();
    final List<Map<String, dynamic>> data = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (data.isNotEmpty) {
      return UserModel.fromMap(data.first);
    } else {
      throw Exception("invalid email or password");
    }
  }
}
