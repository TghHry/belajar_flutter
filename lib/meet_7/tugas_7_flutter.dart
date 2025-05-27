import 'package:belajar_flutter2/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TugasTujuh extends StatefulWidget {
  const TugasTujuh({super.key});
  final bool valueCheck = false;

  @override
  State<TugasTujuh> createState() => _TugasTujuhState();
}

class _TugasTujuhState extends State<TugasTujuh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tugas Tujuh Flutter"),
        centerTitle: true,
        backgroundColor: AppColor.army1,
      ),
      drawer: AppBar(backgroundColor: AppColor.army2),
      body: SafeArea(child: Column()),
    );
  }
}
