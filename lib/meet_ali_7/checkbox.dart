import 'package:flutter/material.dart';

class CheckboxForm extends StatefulWidget {
  const CheckboxForm({super.key});

  @override
  State<CheckboxForm> createState() => _CheckboxFormState();
}

class _CheckboxFormState extends State<CheckboxForm> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CheckboxListTile(
              title: Text("Saya menyetujui semua persyaratan yang berlaku"),
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value ?? false;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              _isChecked
                  ? "Lanjutkan pendaftaran diperbolehkan"
                  : "Anda belum bisa melanjutkan",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}