import 'dart:convert';
import 'package:belajar_flutter2/tugas_15/helper/preference.dart';
import 'package:belajar_flutter2/tugas_15/models/profil_response.dart';
import 'package:belajar_flutter2/tugas_15/models/register_eror.dart';
import 'package:belajar_flutter2/tugas_15/utils/endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  // REGISTER USER
  Future<Map<String, dynamic>> registerUser({
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      final response = await http
          .post(
            Uri.parse(Endpoint.register),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: jsonEncode({
              "name": name,
              "email": email,
              "password": password,
            }),
          )
          .timeout(const Duration(seconds: 10));

      print('Register Status Code: ${response.statusCode}');
      print('Register Response Body: ${response.body}');

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (data['data'] != null || data['user'] != null) {
          return data;
        } else {
          throw Exception(data['message'] ?? 'Registration failed');
        }
      } else {
        throw Exception(
          data['message'] ?? 'Failed to register: ${response.statusCode}',
        );
      }
    } catch (e) {
      print('Register Error: $e');
      throw Exception('Failed to register: $e');
    }
  }

  // LOGIN USER
  Future<Map<String, dynamic>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http
          .post(
            Uri.parse(Endpoint.login),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: jsonEncode({"email": email, "password": password}),
          )
          .timeout(const Duration(seconds: 10));

      print('Login Status Code: ${response.statusCode}');
      print('Login Response Body: ${response.body}');

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final token =
            data['data']?['token'] ??
            data['data']?['access_token'] ??
            data['data']?['auth_token'];
        final user = data['data']?['user'];

        if (token != null) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', token);
          if (user != null) {
            final userJson = jsonEncode(user);
            await prefs.setString('user', userJson);
          }
          print('Token saved: $token');
          return data;
        } else {
          throw Exception(data['message'] ?? 'Token not found in response');
        }
      } else {
        throw Exception(
          data['message'] ?? 'Login gagal: ${response.statusCode}',
        );
      }
    } catch (e) {
      print('Login Error: $e');
      throw Exception(e.toString());
    }
  }

  // GET PROFILE USER
  Future<Map<String, dynamic>> getProfile() async {
    String? token = await PreferenceHandler.getToken();
    final response = await http.get(
      Uri.parse(Endpoint.profile),
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    );

    print("Profile Response Body: ${response.body}");

    if (response.statusCode == 200) {
      final parsed = profileResponseFromJson(response.body).toJson();
      print("Parsed Profile: $parsed");
      return parsed;
    } else if (response.statusCode == 422) {
      return registerErrorResponseFromJson(response.body).toJson();
    } else {
      print("Failed to get profile: ${response.statusCode}");
      throw Exception("Failed to get profile: ${response.statusCode}");
    }
  }
Future<Map<String, dynamic>> updateProfile({
  required String name,
  required String email,
}) async {
  String? token = await PreferenceHandler.getToken();
  final response = await http.put(
    Uri.parse(Endpoint.profile),
    headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    },
    body: jsonEncode({"name": name, "email": email}),
  );

  print("Update Profile Response: ${response.statusCode}");
  print("Body: ${response.body}");

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception("Failed to update profile");
  }
}
Future<void> deleteAccount() async {
    String? token = await PreferenceHandler.getToken();
    final response = await http.delete(
      Uri.parse(Endpoint.profile), // Pastikan endpoint sesuai
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    );

    print("Delete Status: ${response.statusCode}");
    print("Delete Response: ${response.body}");

    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear(); // hapus token dan data user
    } else {
      throw Exception("Gagal menghapus akun");
    }
  }
Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}