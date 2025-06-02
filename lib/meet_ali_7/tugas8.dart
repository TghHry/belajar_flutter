import 'package:flutter/material.dart';
import 'package:belajar_flutter2/meet_ali_7/tugas7.dart';
// import 'package:wave_transition/wave_transition.dart';



class TugasDelapanA extends StatefulWidget {
  const TugasDelapanA({super.key});

  @override
  State<TugasDelapanA> createState() => _TugasDelapanAState();
}

class _TugasDelapanAState extends State<TugasDelapanA> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [const TugasTujuh(), const AboutPage()];

  // final List<String> _titles = ['Home', 'Tentang Aplikasi'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(_titles[_selectedIndex])),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Tentang'),
        ],
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          Text(
            'Tentang Aplikasi',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'Aplikasi ini dibuat sebagai tugas Flutter yang menampilkan form input interaktif dengan Drawer, dan navigasi bawah menggunakan BottomNavigationBar.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Text('Pembuat: Ali Rosi', style: TextStyle(fontSize: 16)),
          Text('Versi: 1.0.0', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
