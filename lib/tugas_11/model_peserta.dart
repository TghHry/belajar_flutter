import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Peserta {
  final int? id;
  final String nama;
  final String email;
  final String kelas;
  final String asal;
  
  Peserta({
    this.id,
    required this.nama,
    required this.email,
    required this.kelas,
    required this.asal,
  });
  
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nama': nama,
      'email': email,
      'kelas': kelas,
      'asal': asal,
    };
  }

  factory Peserta.fromMap(Map<String, dynamic> map) {
    return Peserta(
      id: map['id'] != null ? map['id'] as int : null,
      nama: map['nama'] as String,
      email: map['email'] as String,
      kelas: map['kelas'] as String,
      asal: map['asal'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Peserta.fromJson(String source) => Peserta.fromMap(json.decode(source) as Map<String, dynamic>);
}
