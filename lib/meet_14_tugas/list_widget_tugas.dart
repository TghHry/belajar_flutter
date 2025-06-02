import 'package:flutter/material.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({super.key});

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  final List<String> voucher = [
    "Tiket Bioskop",
    "Tiket Konser & Event Musik",
    "Tiket Wisata & Tempat Hiburan",
    "Voucher Makanan & Minuman",
    "Voucher Belanja (Retail & Online)",
    "Tiket Transportasi (Kereta, Bus, dll)",
    "Tiket Pesawat",
    "Tiket Kapal / Penyeberangan",
    "Tiket Hotel & Penginapan",
    "Voucher Game / Top-up Game",
    // "Tiket Event Olahraga",
    // "Voucher Spa & Kecantikan ",
    // "Voucher Kursus / Workshop",
    // "Tiket Festival / Pameran",
    // "Tiket Taman Bermain / Wahana Anak",
    // "Voucher Streaming (Netflix, Spotify, dll)",
    // "Tiket Teater & Pertunjukan Seni",
    // "Voucher Gym & Fitness Center",
    // "Voucher Donasi / Sumbangan Event",
    // "Tiket Seminar / Webinar",
  ];

  // final List<String> namaMerekHp = [
  //   "Samsung",
  //   "Apple",
  //   "Xiaomi",
  //   "Oppo",
  //   "Vivo",
  //   "Realme",
  //   "Huawei",
  //   "Nokia",
  //   "Sony",
  //   "LG",
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: voucher.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(
                  "${index + 1} ${voucher[index]}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                );
              },
            ),
          ),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: namaMerekHp.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return Text(
          //         "${index + 1} ${namaMerekHp[index]}",
          //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}