import 'package:flutter/material.dart';

class MeetSebelas extends StatelessWidget {
  const MeetSebelas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meet 11"), centerTitle: true),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MeetSebelasA()),
              (route) => false,
            );
          },
          child: Text(
            "This is Meet 11",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class MeetSebelasA extends StatelessWidget {
  const MeetSebelasA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meet 11A"), centerTitle: true),
      body: Center(
        child: Text(
          "This is Meet 11A",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}