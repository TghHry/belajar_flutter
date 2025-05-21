import 'package:flutter/material.dart';

class Tugas1Flutter extends StatelessWidget {
  const Tugas1Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Profile Saya"),
        centerTitle: true,
      ),
      body: Padding(                                  //Nama lenkap
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Teguh Hariyanto",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Row(                                    //alamat
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(Icons.location_on, color: Colors.red),
                SizedBox(width: 5),
                Text(
                  "Jakarta Timur, Indonesia",
                  style: TextStyle(fontSize: 24, color: Colors.blue),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Saya seorang pembelajar flutter pemula yang ingin membuat aplikasi "
              "bermanfaat di era digital, baik untuk diri sendiri maupun masyarakat. "
              "Fokus saya adalah membangun aplikasi islami dan edukatif.",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
