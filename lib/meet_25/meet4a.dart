import 'package:flutter/material.dart';

class MeetEmpatA extends StatelessWidget {
  const MeetEmpatA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xff537D5D)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Materi GridView.count"),
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 12),
              shrinkWrap: true,
              crossAxisSpacing: 10, // Untuk menentukan jarak antar item
              mainAxisSpacing: 10, // Untuk menentukan jarak antar item
              crossAxisCount: 2, // Untuk menentukan jumlah kolom
              children: <Widget>[
                Container(color: Color(0xff73946B)),
                Container(color: Color(0xffD2D0A0)),
                Container(color: Color(0xff9EBC8A)),
              ],
            ),
            Text("Gridview.builder"),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Untuk menentukan jumlah kolom
                childAspectRatio:
                    3 / 4, // Untuk menentukan rasio lebar dan tinggi item
                // mainAxisExtent: 20, // Untuk menentukan tinggi item,
                crossAxisSpacing: 10, // Untuk menentukan jarak antar item
                mainAxisSpacing: 10, // Untuk menentukan jarak antar item
              ),
              itemCount: 1000,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: index % 2 == 0 ? Color(0xff73946B) : Color(0xffD2D0A0),
                  child: Text(
                    index.toString(),

                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}