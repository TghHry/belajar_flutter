import 'package:belajar_flutter2/tugas_14/view/film_detail.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter2/tugas_14/api/get_user.dart'; // Ganti dengan path yang benar
import 'package:belajar_flutter2/tugas_14/models/user_model.dart'; // Ganti dengan path yang benar

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FilmListScreen(),
    );
  }
}

class FilmListScreen extends StatefulWidget {
  const FilmListScreen({Key? key}) : super(key: key);

  @override
  _FilmListScreenState createState() => _FilmListScreenState();
}

class _FilmListScreenState extends State<FilmListScreen> {
  List<Film> _films = [];
  List<Film> _filteredFilms = [];
  bool _isLoading = true;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _fetchFilms();
  }

  Future<void> _fetchFilms() async {
    try {
      final films = await fetchFilms();
      setState(() {
        _films = films;
        _filteredFilms = films; // Inisialisasi daftar film yang difilter
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // Tangani kesalahan di sini jika diperlukan
    }
  }

  void _filterFilms(String query) {
    setState(() {
      _searchQuery = query;
      if (query.isEmpty) {
        _filteredFilms = _films; // Kembali ke daftar lengkap jika query kosong
      } else {
        _filteredFilms = _films.where((film) {
          return film.title!.toLowerCase().contains(query.toLowerCase());
        }).toList(); // Filter daftar film berdasarkan judul
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Film List'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    onChanged:
                        _filterFilms, // Memanggil fungsi filter saat input berubah
                    decoration: InputDecoration(
                      labelText: 'Search',
                      labelStyle: TextStyle(color: Colors.teal),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.teal)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                            color: Colors.teal), // Warna border saat fokus
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                            color: Colors.teal), // Warna border saat diaktifkan
                      ),
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: _fetchFilms,
                    child: ListView.builder(
                      itemCount: _filteredFilms.length,
                      itemBuilder: (context, index) {
                        final film = _filteredFilms[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      FilmDetailScreen(film: film),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    film.title ?? 'No Title',
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Director: ${film.director ?? 'Unknown'}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    'Release Date: ${film.releaseDate ?? 'Unknown'}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    'Rating: ${film.rtScore ?? 'Unknown'}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(height: 12),
                                  if (film.image != null &&
                                      film.image!.isNotEmpty)
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        film.image!,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: 200,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const Center(
                                              child:
                                                  Text('Failed to load image'));
                                        },
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
