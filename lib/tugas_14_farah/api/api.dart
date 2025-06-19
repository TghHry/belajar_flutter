import 'dart:convert';

import 'package:http/http.dart' as http;
// import 'package:ppkdjp_flutter/harry_potter/models/character_model.dart';
import'package:belajar_flutter2/tugas_14_farah/model/model.dart';
Future<List<CharacterModel>> getCharacters() async {
  final response = await http.get(
    Uri.parse("https://hp-api.onrender.com/api/characters"),
  );
  if (response.statusCode == 200) {
    // Handle the case where the API returns an empty array, which is still valid
    if (response.body == '[]' || response.body.isEmpty) {
      return [];
    }
    final List<dynamic> charJson = json.decode(response.body);
    return charJson.map((json) => CharacterModel.fromJson(json)).toList();
  } else {
    // Log the error response for debugging
    print('Failed to load data. Status code: ${response.statusCode}');
    print('Response body: ${response.body}');
    throw Exception('Failed to load data. Status code: ${response.statusCode}');
  }
}

// Add a function to get characters filtered by house
Future<List<CharacterModel>> getCharactersByHouse(String houseName) async {
  // Construct the URL to filter by house directly if the API supports it,
  // or fetch all and filter client-side. The HP API allows filtering by house.
  final String url =
      "https://hp-api.onrender.com/api/characters?house=$houseName";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    if (response.body == '[]' || response.body.isEmpty) {
      return []; // Return empty list if no characters found for the house
    }
    final List<dynamic> charJson = json.decode(response.body);
    return charJson.map((json) => CharacterModel.fromJson(json)).toList();
  } else {
    print(
      'Failed to load characters for house $houseName. Status code: ${response.statusCode}',
    );
    print('Response body: ${response.body}');
    throw Exception(
      'Failed to load characters for house $houseName. Status code: ${response.statusCode}',
    );
  }
}
