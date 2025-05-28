import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({super.key});

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String? _selected;

  final List<String> _categories = [
    "Elektronik",
    "Pakaian",
    "Makanan",
    "Lainnya",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              hint: const Text("Pilih Kategori Produk"),
              items:
                  _categories
                      .map(
                        (cat) => DropdownMenuItem(value: cat, child: Text(cat)),
                      )
                      .toList(),
              onChanged: (val) {
                setState(() {
                  _selected = val;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              _selected != null
                  ? "Anda memilih kategori: $_selected"
                  : "Belum memilih kategori",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
