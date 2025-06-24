import 'package:belajar_flutter2/tugas_15_farah/models/user_model.dart';

class AuthResponse {
  final String message;
  final AuthData?
  data; // Nullable because data can be null on some error responses

  AuthResponse({required this.message, this.data});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      message: json['message'],
      data: json['data'] != null ? AuthData.fromJson(json['data']) : null,
    );
  }
}

class AuthData {
  final String token;
  final User user;

  AuthData({required this.token, required this.user});

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return AuthData(token: json['token'], user: User.fromJson(json['user']));
  }
}