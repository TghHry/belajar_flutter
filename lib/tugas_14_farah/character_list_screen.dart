import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
// import 'package:ppkdjp_flutter/constant/app_image.dart';
// import 'package:ppkdjp_flutter/harry_potter/api/hp_api.dart';
// import 'package:ppkdjp_flutter/harry_potter/models/character_model.dart';
import 'package:belajar_flutter2/tugas_14_farah/model/model.dart';
import 'package:belajar_flutter2/tugas_14_farah/api/api.dart';
import 'package:belajar_flutter2/constant/app_image_farah.dart';

class CharacterListScreen extends StatelessWidget {
  const CharacterListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Harry Potter Characters")),
      body: SafeArea(
        child: FutureBuilder<List<CharacterModel>>(
          future: getCharacters(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Lottie.asset(
                  AppImage.loading,
                  width: 300,
                  height: 300,
                  repeat: true,
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No characters found.'));
            }

            final characters = snapshot.data!;

            return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final char = characters[index];
                return ListTile(
                  leading:
                      char.image.isNotEmpty
                          ? CircleAvatar(
                            backgroundImage: NetworkImage(char.image),
                          )
                          : CircleAvatar(
                            child: Text(
                              char.name.isNotEmpty ? char.name[0] : '?',
                            ),
                          ),

                  title: Text(char.name),
                  subtitle: Text(char.house.name),
                );
              },
            );
          },
        ),
      ),
    );
  }
}