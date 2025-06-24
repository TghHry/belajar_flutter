import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:belajar_flutter2/tugas_15_farah/config/app_config.dart';
import 'package:belajar_flutter2/tugas_15_farah/models/auth_response_model.dart';
import 'package:belajar_flutter2/tugas_15_farah/models/user_model.dart';
import 'package:belajar_flutter2/tugas_15_farah/utils/shared_prefs_utils.dart';


class ApiService {
  final String _baseUrl = AppConfig.baseUrl;

  Future<Map<String, dynamic>> _handleResponse(http.Response response) async {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final decodedResponse = json.decode(response.body);
      return decodedResponse;
    } else if (response.statusCode == 401) {
      await SharedPrefsUtil.removeAuthToken();
      throw Exception('Unauthenticated.');
    } else {
      try {
        final decodedResponse = json.decode(response.body);
        if (decodedResponse.containsKey('errors')) {
          throw Exception(json.encode(decodedResponse));
        } else if (decodedResponse.containsKey('message') &&
            decodedResponse['message'] is String) {
          throw Exception(decodedResponse['message']);
        }
        throw Exception(
          'API Error: ${response.statusCode} - ${decodedResponse.toString()}',
        );
      } catch (e) {
        throw Exception(response.body);
      }
    }
  }

  // ------------------------- AUTHENTICATION -------------------------

  Future<AuthResponse> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$_baseUrl/api/register');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({'name': name, 'email': email, 'password': password}),
      );

      final decodedResponse = await _handleResponse(response);

      final authResponse = AuthResponse.fromJson(decodedResponse);
      await SharedPrefsUtil.saveAuthToken(authResponse.data!.token);
      return authResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$_baseUrl/api/login');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({'email': email, 'password': password}),
      );

      final decodedResponse = await _handleResponse(response);

      final authResponse = AuthResponse.fromJson(decodedResponse);
      await SharedPrefsUtil.saveAuthToken(authResponse.data!.token);
      return authResponse;
    } catch (e) {
      rethrow;
    }
  }

  // ------------------------- PROFILE -------------------------

  Future<User> getProfile() async {
    final url = Uri.parse('$_baseUrl/api/profile');
    final token = await SharedPrefsUtil.getAuthToken();

    if (token == null) {
      throw Exception('Authentication token not found. Please log in.');
    }

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      final decodedResponse = await _handleResponse(response);

      if (decodedResponse.containsKey('data')) {
        return User.fromJson(decodedResponse['data']);
      } else {
        return User.fromJson(decodedResponse);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<User> updateProfile({required String name}) async {
    final url = Uri.parse('$_baseUrl/api/profile');
    final token = await SharedPrefsUtil.getAuthToken();

    if (token == null) {
      throw Exception('Authentication token not found. Please log in.');
    }

    final Map<String, dynamic> body = {'name': name};

    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(body),
      );

      final decodedResponse = await _handleResponse(response);

      if (decodedResponse.containsKey('data')) {
        return User.fromJson(decodedResponse['data']);
      } else {
        return User.fromJson(decodedResponse);
      }
    } catch (e) {
      rethrow;
    }
  }

  // ------------------------- LOGOUT -------------------------
  Future<void> logout() async {
    await SharedPrefsUtil.removeAuthToken();
  }

  // ------------------------- DELETE ACCOUNT (Requires Backend Implementation) -------------------------
  Future<void> deleteAccount() async {
    await SharedPrefsUtil.removeAuthToken();
  }
}