import 'package:flutter/material.dart';
import 'package:belajar_flutter2/meet_12/meet_12c.dart';
import 'package:belajar_flutter2/constant/app_color.dart';
import 'package:belajar_flutter2/constant/app_style.dart';
import 'package:belajar_flutter2/meet_12/meet_12a.dart';
import 'package:belajar_flutter2/meet_4/contoh_4.dart';

class MeetDuaBelasB extends StatefulWidget {
  const MeetDuaBelasB({super.key});
  static const String id = "/meet_12b";

  @override
  State<MeetDuaBelasB> createState() => _MeetDuaBelasBState();
}

class _MeetDuaBelasBState extends State<MeetDuaBelasB> {
  int _selectedIndex = 0;
  static const List<Widget> _screen = [
    // Center(child: Text("Home Screen")),
    MeetDuaBelasC(),
    Meet12AInputWidget(),
    // MeetSatu(),
    MeetEmpatA(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
          print("Halaman saat ini : $_selectedIndex");
        },
        currentIndex: _selectedIndex,
        selectedItemColor: AppColor.army1,
        unselectedItemColor: AppColor.gray88,
        unselectedLabelStyle: AppStyle.fontRegular(
          fontSize: 10,
        ).copyWith(color: AppColor.gray88),
        selectedLabelStyle: AppStyle.fontBold(
          fontSize: 10,
        ).copyWith(color: AppColor.army1),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}