import 'package:belajar_flutter2/meet_14/meet_14b_validation.dart';
import 'package:flutter/material.dart';
// import 'package:belajar_flutter2/meet_14/meet_14b_validation.dart';
import 'package:belajar_flutter2/Meet_11/login_screen.dart';
import 'package:belajar_flutter2/constant/app_color.dart';
import 'package:belajar_flutter2/meet_14/meet_14a.dart';
import 'package:belajar_flutter2/helper/preference.dart';
import 'package:belajar_flutter2/constant/app_image.dart';
import 'package:belajar_flutter2/constant/app_style.dart';
// import 'package:belajar_flutter2/meet_14/meet_14_b_thanks_screen.dart';

class MeetDuaBelasC extends StatefulWidget {
  const MeetDuaBelasC({super.key});

  @override
  State<MeetDuaBelasC> createState() => _MeetDuaBelasCState();
}

class _MeetDuaBelasCState extends State<MeetDuaBelasC> {
  int _selectedIndex = 0;
  static const List<Widget> _screen = [
    Center(child: Text("Halaman 1")),
    Meet14a(),
    Meet14b(),
    // Center(child: Text("Halaman 2")),
    // Meet12AInputWidget(),
    Center(child: Text("Halaman 3")),
  ];
  void _itemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    print("Halaman saat ini : $_selectedIndex");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Menu Drawer")),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: AppColor.army2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(AppImage.belanja),
                  ),
                  Text(
                    "Andrea Surya Habibie",
                    style: AppStyle.fontRegular(fontSize: 16),
                  ),
                  Text(
                    "projecthabibie@gmail.com",
                    style: AppStyle.fontBold(fontSize: 16),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: AppColor.army1),
              title: Text("Home", style: AppStyle.fontRegular(fontSize: 14)),
              onTap: () {
                _itemTapped(0);
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.home, color: AppColor.army1),
              title: Text(
                "List dan Map",
                style: AppStyle.fontRegular(fontSize: 14),
              ),
              onTap: () {
                _itemTapped(1);
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.key, color: AppColor.army1),
              title: Text(
                "Validator",
                style: AppStyle.fontRegular(fontSize: 14),
              ),
              onTap: () {
                _itemTapped(2);
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: AppColor.orange),
              title: Text("Keluar", style: AppStyle.fontRegular(fontSize: 14)),
              onTap: () {
                PreferenceHandler.deleteLogin();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      body: _screen[_selectedIndex],
    );
  }
}