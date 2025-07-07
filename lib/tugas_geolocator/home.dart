import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class TugasGeolocator extends StatelessWidget {
  const TugasGeolocator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Map + Geolocator + Geocoding', // Judul aplikasi
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // Data Awal
  GoogleMapController? mapController;
  LatLng _currentPosition =
      const LatLng(-6.210800, 106.812940); // Default: Jakarta
  String _currentAddress = 'Alamat tidak ditemukan';
  Marker? _marker; // Marker untuk lokasi saat ini

  @override
  void initState() {
    super.initState();
    _getCurrentLocation(); // Dapatkan lokasi saat ini ketika widget diinisialisasi
  }

  // Fungsi untuk mendapatkan lokasi saat ini
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Periksa apakah layanan lokasi diaktifkan.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Layanan lokasi tidak diaktifkan, jangan lanjutkan
      // akses posisi dan minta pengguna Aplikasi untuk
      // mengaktifkan layanan lokasi.
      await Geolocator.openLocationSettings();
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Izin ditolak, lain kali Anda dapat mencoba
        // meminta izin lagi (ini juga tempat
        // Android's shouldShowRequestPermissionRationale
        // mengembalikan true. Sesuai pedoman Android,
        // Aplikasi Anda harus menampilkan UI penjelasan sekarang.
        return Future.error('Izin lokasi ditolak');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Izin ditolak secara permanen, tangani dengan tepat.
      return Future.error(
          'Izin lokasi ditolak secara permanen, kami tidak dapat meminta izin.');
    }

    // Ketika kita mencapai di sini, izin diberikan dan kita dapat
    // melanjutkan mengakses posisi perangkat.
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high, // Akurasi tinggi
    );

    // Perbarui posisi saat ini
    _currentPosition = LatLng(position.latitude, position.longitude);

    // Dapatkan informasi alamat dari koordinat
    List<Placemark> placemarks = await placemarkFromCoordinates(
      _currentPosition.latitude,
      _currentPosition.longitude,
      // localeIdentifier: "id_ID", // Spesifikasi locale untuk hasil yang lebih baik
    );
    Placemark place = placemarks[0]; // Ambil placemark pertama

    // Perbarui state dengan lokasi dan alamat baru
    setState(() {
      _marker = Marker(
        markerId: const MarkerId('lokasi_saya'), // ID unik untuk marker
        position: _currentPosition, // Posisi marker
        infoWindow: InfoWindow(
          title: 'Lokasi Anda', // Judul jendela info
          snippet: '${place.street}, ${place.locality}', // Snippet info
        ),
        icon: BitmapDescriptor.defaultMarker, // Ikon marker default
      );

      // Bentuk alamat lengkap
      _currentAddress =
          '${place.name}, ${place.street}, ${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}';
      // Anda mungkin perlu menyesuaikan bagaimana alamat ditampilkan berdasarkan data yang Anda inginkan
      // Contoh: 'Jl. ${place.thoroughfare}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}'
    });

    // Animasikan kamera peta ke lokasi saat ini
    mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: _currentPosition, zoom: 16), // Zoom ke level 16
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Peta Google + Geolocator + Geocoding'), // Judul AppBar
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _currentPosition,
              zoom: 14, // Zoom awal
            ),
            onMapCreated: (controller) {
              mapController = controller; // Simpan controller peta
            },
            markers:
                _marker != null ? {_marker!} : {}, // Tampilkan marker jika ada
            myLocationEnabled: true, // Aktifkan penunjuk lokasi saya
            myLocationButtonEnabled: true, // Aktifkan tombol lokasi saya
          ),
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Card(
              color: Colors.white,
              elevation: 4, // Elevasi kartu
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  _currentAddress, // Tampilkan alamat saat ini
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            _getCurrentLocation, // Panggil fungsi untuk mendapatkan lokasi saat ini
        child: const Icon(Icons.refresh), // Ikon refresh
        tooltip: 'Segarkan Lokasi', // Tooltip tombol
      ),
    );
  }
}
