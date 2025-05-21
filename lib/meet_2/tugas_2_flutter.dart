import 'package:flutter/material.dart';

class MeetDua extends StatelessWidget {
  const MeetDua({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Profil Lengkap"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Foto Profil
                  Container(
                    width: 90,
                    height: 90,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Colors.blue, Colors.purple],
                      ),
                    ),
                    child: const Center(
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("assets/images/download.jpg"),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Nama
                  const Text(
                    "Teguh Hariyanto",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text(
                      "Saya seorang pembelajar flutter pemula yang ingin membuat aplikasi "
                      "bermanfaat di era digital, baik untuk diri sendiri maupun masyarakat. "
                      "Fokus saya adalah membangun aplikasi islami dan edukatif.",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Email Box
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.email, color: Colors.blue),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "hariyantoteguh193@gmail.com",
                              style: TextStyle(fontSize: 18, color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Phone
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Row(
                      children: [
                        Spacer(),
                        Icon(Icons.phone, color: Colors.green),
                        Spacer(),
                        Text(
                          "0815-3456-8909",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  // Postingan dan Followers
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                "Postingan",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                "Followers",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Hiasan visual bawah
          Container(
            height: 30,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.lightBlueAccent],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
