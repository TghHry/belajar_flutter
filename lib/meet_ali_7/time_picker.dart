import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({super.key});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay? _selectedTime;

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 7, minute: 30),
    );

    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _pickTime,
              child: Text("Pilih Waktu Pengingat"),
            ),
            SizedBox(height: 20),
            Text(
              _selectedTime != null
                  ? "Pengingat diatur pukul: ${_selectedTime!.format(context)}"
                  : "Belum memilih waktu",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}