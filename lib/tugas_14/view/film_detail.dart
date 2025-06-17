import 'package:flutter/material.dart';
import 'package:belajar_flutter2/tugas_14/models/user_model.dart'; // Ganti dengan path yang benar




class FilmDetailScreen extends StatelessWidget {
  final Welcome film;

  const FilmDetailScreen({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(film.title ?? 'Film Detail'),
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Menampilkan gambar film dengan animasi opacity
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AnimatedOpacity(
                  opacity: 1.0, // Atur opacity ke 1 untuk menunjukkan gambar
                  duration: const Duration(milliseconds: 300), // Durasi animasi
                  child: Image.network(
                    film.image!,
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(child: Text('Failed to load image'));
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Menampilkan judul film
              Text(
                film.title ?? 'No Title',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Menampilkan informasi film
              Text(
                'Director: ${film.director ?? 'Unknown'}',
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                'Release Date: ${film.releaseDate ?? 'Unknown'}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              // Menampilkan deskripsi film
              Text(
                'Description:',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                film.description ?? 'No Description',
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),
              // Menampilkan informasi tambahan
              if (film.species != null && film.species!.isNotEmpty) ...[
                Text(
                  'Species: ${film.species!.join(', ')}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
              ],
              if (film.locations != null && film.locations!.isNotEmpty) ...[
                Text(
                  'Locations: ${film.locations!.join(', ')}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
              ],
              if (film.vehicles != null && film.vehicles!.isNotEmpty) ...[
                Text(
                  'Vehicles: ${film.vehicles!.join(', ')}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
              ],
              if (film.people != null && film.people!.isNotEmpty) ...[
                Text(
                  'People: ${film.people!.join(', ')}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
