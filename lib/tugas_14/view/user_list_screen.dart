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
  List<Welcome> _films = [];
  List<Welcome> _filteredFilms = [];
  String _searchQuery = '';

  Future<List<Welcome>> _fetchFilms() async {
    final films = await fetchFilms();
    return films;
  }

  void _filterFilms(String query) {
    setState(() {
      _searchQuery = query;
      if (query.isEmpty) {
        _filteredFilms = _films;
      } else {
        _filteredFilms = _films.where((film) {
          return film.title!.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  Future<void> _refreshFilms() async {
    final films = await _fetchFilms();
    setState(() {
      _films = films;
      _filteredFilms = films; // Reset daftar film yang difilter
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Film List'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _refreshFilms(); // Memanggil fungsi refresh saat ikon ditekan
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Welcome>>(
        future: _fetchFilms(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            _films = snapshot.data!;
            _filteredFilms = _films; // Inisialisasi daftar film yang difilter

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    onChanged: _filterFilms,
                    decoration: InputDecoration(
                      labelText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: _filteredFilms.length,
                    itemBuilder: (context, index) {
                      final film = _filteredFilms[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  FilmDetailScreen(film: film),
                            ),
                          );
                        },
                        child: Card(
                          margin: const EdgeInsets.only(bottom: 16),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: AnimatedOpacity(
                                    opacity:
                                        1.0, // Atur opacity ke 1 untuk menunjukkan gambar
                                    duration: const Duration(
                                        milliseconds: 300), // Durasi animasi
                                    child: Image.network(
                                      film.image!,
                                      fit: BoxFit.cover,
                                      height: 250,
                                      width: double.infinity,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    (loadingProgress
                                                            .expectedTotalBytes ??
                                                        1)
                                                : null,
                                          ),
                                        );
                                      },
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Center(
                                            child:
                                                Text('Failed to load image'));
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    film.title ?? 'No Title',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    'Director: ${film.director ?? 'Unknown'}',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    'Release Date: ${film.releaseDate ?? 'Unknown'}',
                                    style: const TextStyle(fontSize: 12),
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
              ],
            );
          } else {
            return const Center(child: Text('No films found.'));
          }
        },
      ),
    );
  }
}
