import 'package:flutter/material.dart';

class MeetDua extends StatelessWidget {
  const MeetDua({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber, title: Text("Meet Dua")),
      body: Column(
        children: [
          //Materi SizedBox
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "PPKD B 2",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [Text("Kelas Mobile Programming")],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Angkatan 2"), SizedBox(width: 4), Text("Keren")],
          ),

          //Materi Padding
          Padding(
            padding: const EdgeInsets.all(
              8.0,
            ), //Padding all, bingkai untuk semua arah
            child: Text(
              "Kami bersatu bersama-sama untuk mencapai tujuan bersama",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16), //Padding only left
            child: Text(
              "Kami bersatu bersama-sama untuk mencapai tujuan bersama",
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 16), //Padding only left
            child: Text(
              "Kami bersatu bersama-sama untuk mencapai tujuan bersama",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32), //Padding only left
            child: Text(
              "Kami bersatu bersama-sama untuk mencapai tujuan bersama",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 120), //Padding only left
            child: Text(
              "Kami bersatu bersama-sama untuk mencapai tujuan bersama",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 32,
            ), //Padding only left
            child: Text(
              "Kami bersatu bersama-sama untuk mencapai tujuan bersama",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 60,
            ), //Padding only left
            child: Text(
              "Kami bersatu bersama-sama untuk mencapai tujuan bersama",
            ),
          ),

          //Materi Container
          Container(
            // height: 40,
            padding: const EdgeInsets.all(12.0), // Bingkai child
            margin: EdgeInsets.all(12), // Bingkai luar
            width: double.infinity,
            // color: Colors.blueAccent, //Jangan letakkan ini di luar BoxDecoration jika menggunakan BoxDecoration
            decoration: BoxDecoration(
              color: Colors.blueAccent, // Memberikan warna untuk container
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ), // Membuat radius dibagian luar
              border: Border.all(), // Untuk menampilkan border diluar
              // shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.yellow, Colors.red],
                begin: Alignment.topRight,
                end: Alignment.bottomRight,

                // transform: G
                // tileMode: TileMode.repeated,
              ),
            ),
            child: Column(
              children: [
                Text("Pengumuman"),
                Text("Yth. PPKD JP"),
                Text("Hari ini tanggal sekian"),
                Text("Telah terdaftar"),
                Text("1200 Peserta baru"),
              ],
            ),
          ),
          //Materi Expanded
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(height: 20, color: Colors.red),
              ),
              Expanded(child: Container(height: 20, color: Colors.green)),
              Expanded(
                flex: 2,

                child: Container(height: 20, color: Colors.yellow),
              ),
            ],
          ),
          Expanded(child: Container(color: Colors.blueGrey)), // Expanded
        ],
      ),
    );
  }
}