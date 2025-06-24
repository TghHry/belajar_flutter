import 'package:belajar_flutter2/meet_2/tugas_2_flutter.dart';
import 'package:belajar_flutter2/meet_6/tugas_6_flutter.dart';
import 'package:belajar_flutter2/meet_8/tugas_8_flutter.dart';
import 'package:belajar_flutter2/tugas_10/tugas_10_main.dart';
import 'package:belajar_flutter2/tugas_11_12/tugas_11.dart';
import 'package:belajar_flutter2/tugas_14_farah/splash_screen.dart';
import 'package:belajar_flutter2/utils/splash_screen.dart';
import 'package:flutter/material.dart';

class TugasTujuh extends StatefulWidget {
  const TugasTujuh({super.key});
  static const String id = "/TugasTujuh";

  @override
  State<TugasTujuh> createState() => _TugasTujuhState();
}

enum MenuType { checkbox, switchMode, dropdown, date, time }

class _TugasTujuhState extends State<TugasTujuh> {
  MenuType _selectedMenu = MenuType.checkbox;

  // Checkbox
  bool _isChecked = false;

  // Switch
  bool _isDarkMode = false;

  // Dropdown
  String? _selectedCategory;

  // Date
  DateTime? _selectedDate;

  // Time
  TimeOfDay? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _isDarkMode ? ThemeData.dark() : ThemeData.fallback(),
      // data: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Tugas 7 Form ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white24,
        ),
        drawer: Drawer(
          backgroundColor: Colors.white70,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.white24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TugasDua()));
                      },
                      child: CircleAvatar(
                        radius: 34,
                        backgroundImage: AssetImage("assets/images/luffy.jpg"),
                      ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Teguh Hariyanto",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Angkatan 2 MP",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.check_box),
                title: const Text('Syarat & Ketentuan'),
                onTap: () {
                  setState(() => _selectedMenu = MenuType.checkbox);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.brightness_medium_sharp),
                title: const Text('Mode Gelap'),
                onTap: () {
                  setState(() => _selectedMenu = MenuType.switchMode);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.category),
                title: const Text('Pilih Kategori Produk'),
                onTap: () {
                  setState(() => _selectedMenu = MenuType.dropdown);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.date_range),
                title: const Text('Pilih Tanggal Lahir'),
                onTap: () {
                  setState(() => _selectedMenu = MenuType.date);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.access_time),
                title: const Text('Atur Pengingat'),
                onTap: () {
                  setState(() => _selectedMenu = MenuType.time);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Title(color: Colors.black, child: Icon(Icons.logout)),
                title: Text("Log-out"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SplashScreen(),
                      ));
                },
              ),
              ListTile(
                leading: Title(
                    color: Colors.black, child: Icon(Icons.login_outlined)),
                title: Text("Tugas Enam (Login)"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TugasEnam(),
                      ));
                },
              ),
              ListTile(
                leading:
                    Title(color: Colors.black, child: Icon(Icons.home_work)),
                title: Text("Tugas Sepuluh"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TugasSepuluh(),
                      ));
                },
              ),
              ListTile(
                leading:
                    Title(color: Colors.black, child: Icon(Icons.home_work)),
                title: Text("Tugas Sebelas"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TugasSebelas(),
                      ));
                },
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            SizedBox.expand(
                // child: Image.asset("assets/images/black.jpg", fit: BoxFit.cover),
                ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: SingleChildScrollView(child: _buildBody()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedMenu) {
      case MenuType.checkbox:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Syarat & Ketentuan", style: TextStyle(fontSize: 20)),
            CheckboxListTile(
              title: const Text(
                "Saya menyetujui semua persyaratan yang berlaku",
              ),
              value: _isChecked,
              onChanged: (val) => setState(() => _isChecked = val ?? false),
            ),
            Text(
              _isChecked
                  ? "Lanjutkan pendaftaran diperbolehkan"
                  : "Anda belum bisa melanjutkan",
            ),
          ],
        );

      case MenuType.switchMode:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Mode Gelap / Mode Terang",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SwitchListTile(
              title: Text(
                _isDarkMode ? "Aktifkan Mode Gelap" : "Mode Terang Aktif",
              ),
              value: _isDarkMode,
              onChanged: (val) => setState(() => _isDarkMode = val),
            ),
          ],
        );

      case MenuType.dropdown:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Pilih Kategori Produk", style: TextStyle(fontSize: 20)),
            DropdownButton<String>(
              value: _selectedCategory,
              hint: const Text("Pilih Kategori"),
              items: ["Elektronik", "Pakaian", "Makanan", "Lainnya"]
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => setState(() => _selectedCategory = val),
            ),
            if (_selectedCategory != null)
              Text("Anda memilih kategori: $_selectedCategory"),
          ],
        );

      case MenuType.date:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Pilih Tanggal Lahir", style: TextStyle(fontSize: 20)),
            ElevatedButton(
              onPressed: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  setState(() => _selectedDate = picked);
                }
              },
              child: const Text("Pilih Tanggal Lahir"),
            ),
            if (_selectedDate != null)
              Text("Tanggal Lahir: ${_formatDate(_selectedDate!)}"),
          ],
        );

      case MenuType.time:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Atur Pengingat", style: TextStyle(fontSize: 20)),
            ElevatedButton(
              onPressed: () async {
                TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (picked != null) {
                  setState(() => _selectedTime = picked);
                }
              },
              child: const Text("Pilih Waktu Pengingat"),
            ),
            if (_selectedTime != null)
              Text("Pengingat diatur pukul: ${_selectedTime!.format(context)}"),
          ],
        );
    }
  }

  String _formatDate(DateTime date) {
    return "${date.day} ${_monthName(date.month)} ${date.year}";
  }

  String _monthName(int month) {
    const months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];
    return months[month - 1];
  }
}
