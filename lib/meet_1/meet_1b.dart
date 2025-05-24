//19 Mei 2025
import 'package:flutter/material.dart';

class MeetSatu extends StatelessWidget {
  const MeetSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent, // Changed color to indigoAccent
        title: Text("Pertemuan 1"), // Changed title to "Pertemuan 1"
        centerTitle: true, // Centered the title
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Action for search button
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Pertemuan 1", style: TextStyle(fontSize: 35)),
            Text("PPKD B 2"),
            Text("Kelas Mobile Programming"),
            Text("Nama Toko"),
            Row(children: [Text("Gambar 1")]),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text("Gambar 2")],
            ),
            Text("Gambar 3"),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Text("Gambar 4")],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Gambar 5")],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text("Gambar 6")],
            ),
            Text("Gambar 7"),
            Row(
              children: [
                Text("Gambar 1"),
                Text("Gambar 2"),
                Text("Gambar 3"),
                Text("Gambar 4"),
                Text("Gambar 5"),
                Text("Gambar 6"),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[100], // Changed background color to white
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigoAccent,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Pertemuan 1",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          Text(
            "PPKD B 2",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          Text(
            "Kelas Mobile Programming",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text(
            "Nama Toko",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.blue[800],
            ),
          ),
          Text.rich(
            TextSpan(
              text: "Toko Saya bernama",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: " @habibie_shop",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue[800],
                  ),
                ),
                TextSpan(
                  text: " beralamat di Blok M",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                "Gambar 1",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),

          Text(
            "Gambar 3 Gambar 3 Gambar 3 Gambar 3 Gambar 3 Gambar 3 Gambar 3",
            maxLines: 2,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Text(
                  "Gambar 5 Gambar 5 Gambar 5 Gambar 5 Gambar 5 Gambar 5 Gambar 5",

                  // maxLines: 2,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text("Gambar 4 Gambar 5")],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Gambar 5")],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text("Gambar 6")],
          ),
          Row(
            children: [
              Text("Gambar 1"),
              Text("Gambar 2"),
              Text("Gambar 3"),
              Text("Gambar 4"),
              Text("Gambar 5"),
              Text("Gambar 6"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.email),
              Icon(Icons.email, color: Colors.blue),
              Icon(Icons.email, size: 50),
              Text(
                "Email:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}