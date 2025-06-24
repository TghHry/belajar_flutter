import 'package:http/http.dart' as http;

import 'package:belajar_flutter2/tugas_14/models/user_model.dart'; // Ganti dengan path yang benar

Future<List<Film>> fetchFilms() async {
  final response = await http.get(
    Uri.parse('https://ghibliapi.vercel.app/films'),
  );

  if (response.statusCode == 200) {
    // Langsung decode body response ke List<Film>
    return filmFromJson(response.body);
  } else {
    throw Exception(
        'Failed to load films. Status code: ${response.statusCode}');
  }
  
}


