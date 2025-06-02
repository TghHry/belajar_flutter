import 'package:flutter/material.dart';

import 'package:belajar_flutter2/meet_14_tugas/list_in_map_widget_tugas.dart';
import 'package:belajar_flutter2/meet_14_tugas/list_widget_tugas.dart';
import 'package:belajar_flutter2/meet_14_tugas/model_widget_tugas.dart';

class TugasEmpatBelas extends StatelessWidget {
  const TugasEmpatBelas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tugas 9"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListWidget()),
                    );
                  },
                  child: Text("List"),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListInMapWidget()),
                );
              },
              child: Text("List and Map"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ModelWidget()),
                );
              },
              child: Text("Model Kategori"),
            ),
          ],
        ),
      ),
    );
  }
}
