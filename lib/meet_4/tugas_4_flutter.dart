import 'package:flutter/material.dart';

class TugasEmpat extends StatelessWidget {
  const TugasEmpat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulir & Produk"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // FORMULIR
          const TextField(
            decoration: InputDecoration(
              labelText: 'Nama',
              prefixIcon: Icon(Icons.person),
              hintText: 'Contoh : Rudi Tabuti',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Contoh : rudi123@gmail.com',
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 12),
          const TextField(
            decoration: InputDecoration(
              labelText: 'No. HP',
              hintText: 'Contoh : 089655262727',
              prefixIcon: Icon(Icons.phone),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 12),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Deskripsi',
              hintText: 'Tuliskan deskripsi',
              prefixIcon: Icon(Icons.description),
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 24),
          const Divider(),
          const Text(
            "Daftar Produk",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          // PRODUK LIST
          ListTile(
            leading: const Icon(Icons.phone_android, color: Colors.blue),
            title: const Text("Smartphone"),
            trailing: const Icon(Icons.arrow_forward_ios),
            subtitle: const Text("Rp 0 - 10.000.000"),
          ),
          ListTile(
            leading: const Icon(Icons.laptop_mac, color: Colors.green),
            title: const Text("Laptop "),
            trailing: const Icon(Icons.arrow_forward_ios),
            subtitle: const Text("Rp 0 - 10.000.000"),
          ),
          ListTile(
            leading: const Icon(Icons.headphones, color: Colors.orange),
            title: const Text("Headphone"),
            trailing: const Icon(Icons.arrow_forward_ios),
            subtitle: const Text("Rp 0 - 5.000.000"),
          ),
          ListTile(
            leading: const Icon(Icons.watch, color: Colors.purple),
            title: const Text("Smartwatch "),
            trailing: const Icon(Icons.arrow_forward_ios),
            subtitle: const Text("Rp 0 - Rp 3.000.000"),
          ),
          ListTile(
            leading: const Icon(Icons.tv, color: Colors.red),
            title: const Text("Smart TV"),
            trailing: Icon(Icons.arrow_forward_ios),
            subtitle: const Text("Rp 0 - Rp 7.0000.000 "),
          ),
        ],
      ),
    );
  }
}
