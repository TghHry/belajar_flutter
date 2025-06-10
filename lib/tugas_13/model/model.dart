import 'dart:convert';

class Kehadiran {
  final String? name;
  final String? username;
  final String email;
  final String phone;
  final String password;
  Kehadiran({
    this.name,
    this.username,
    required this.email,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'username': username,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }

  factory Kehadiran.fromMap(Map<String, dynamic> map) {
    return Kehadiran(
      name: map['name'] != null ? map['name'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      email: map['email'] as String,
      phone: map['phone'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
