import 'package:flutter/material.dart';
import 'package:belajar_flutter2/latihan_sqlite/database_instance.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  DatabaseInstance databaseInstance = DatabaseInstance();
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nama Produk"),
            TextField(
              controller: nameController,
            ),
            SizedBox(height: 15),
            Text("kategori"),
            TextField(
              controller: categoryController,
            ),
            SizedBox(height: 15),
            ElevatedButton(
                onPressed: () async {
                  await databaseInstance.insert({
                    'name': nameController.text,
                    'category': categoryController.text,
                    'created_at': DateTime.now().toString(),
                    'updated_at': DateTime.now().toString(),
                  });
                  Navigator.pop(context, true);
                  // setState(() {});
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
