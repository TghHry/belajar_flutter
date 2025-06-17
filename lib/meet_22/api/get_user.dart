import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:belajar_flutter2/meet_22/model/user_model.dart';

Future<List<Users>> fetchUsers() async {
  final response = await http.get(
    Uri.parse('https://reqres.in/api/users?page=2'),
  );
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final List<dynamic> userData = data['data'];
    return userData.map((user) => Users.fromJson(user)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}