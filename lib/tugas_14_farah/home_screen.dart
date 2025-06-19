// // lib/screens/home_screen.dart
// import 'package:flutter/material.dart';
// import 'package:ppkdjp_flutter/harry_potter/models/character_model.dart'; // Import your CharacterModel
// import 'package:ppkdjp_flutter/harry_potter/api/hp_api.dart' as api_service;
// import 'package:ppkdjp_flutter/harry_potter/screens/house_selection_screen.dart'; // Import your API service

// // Placeholder screens for navigation (create these files later)
// class CharactersScreen extends StatelessWidget {
//   final HogwartsHouse selectedHouse;
//   const CharactersScreen({required this.selectedHouse, Key? key})
//     : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('${selectedHouse.toString().split('.').last} Characters'),
//       ),
//       body: Center(
//         child: FutureBuilder<List<CharacterModel>>(
//           future: api_service.getCharactersByHouse(
//             selectedHouse.toString().split('.').last,
//           ),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//               return Text(
//                 'No characters found for ${selectedHouse.toString().split('.').last}.',
//               );
//             } else {
//               return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   final character = snapshot.data![index];
//                   return Card(
//                     margin: const EdgeInsets.all(8.0),
//                     child: ListTile(
//                       leading:
//                           character.image.isNotEmpty
//                               ? CircleAvatar(
//                                 backgroundImage: NetworkImage(character.image),
//                               )
//                               : null,
//                       title: Text(character.name),
//                       subtitle: Text(
//                         '${character.house.toString().split('.').last} | ${character.species}',
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

// class SpellsScreen extends StatelessWidget {
//   const SpellsScreen({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(title: const Text('Spells')),
//     body: const Center(child: Text('Spells Content Here')),
//   );
// }

// class WandsScreen extends StatelessWidget {
//   const WandsScreen({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(title: const Text('Wands')),
//     body: const Center(child: Text('Wands Content Here')),
//   );
// }

// class PlacesScreen extends StatelessWidget {
//   const PlacesScreen({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(title: const Text('Places')),
//     body: const Center(child: Text('Places Content Here')),
//   );
// }

// class LettersScreen extends StatelessWidget {
//   const LettersScreen({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(title: const Text('Letters')),
//     body: const Center(child: const Text('Letters Content Here')),
//   );
// }

// class SendLetterScreen extends StatelessWidget {
//   const SendLetterScreen({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(title: const Text('Send Letter')),
//     body: const Center(child: Text('Send Letter Content Here')),
//   );
// }

// // Add more placeholder screens for "Series" and "Symbols" if needed.
// class SeriesScreen extends StatelessWidget {
//   const SeriesScreen({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(title: const Text('Watch Series')),
//     body: const Center(child: Text('Series Content Here')),
//   );
// }

// class SymbolsScreen extends StatelessWidget {
//   const SymbolsScreen({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(title: const Text('Symbols')),
//     body: const Center(child: Text('Symbols Content Here')),
//   );
// }

// class HomeScreen extends StatelessWidget {
//   final HogwartsHouse selectedHouse;

//   const HomeScreen({this.selectedHouse = HogwartsHouse.none, Key? key})
//     : super(key: key);

//   // Helper method to get the background image based on the selected house
//   String _getBackgroundImage(HogwartsHouse house) {
//     switch (house) {
//       case HogwartsHouse.gryffindor:
//         return 'assets/images/gryffindor_bg.jpg';
//       case HogwartsHouse.slytherin:
//         return 'assets/images/slytherin_bg.jpg';
//       case HogwartsHouse.ravenclaw:
//         return 'assets/images/ravenclaw_bg.jpg';
//       case HogwartsHouse.hufflepuff:
//         return 'assets/images/hufflepuff_bg.jpg';
//       case HogwartsHouse.none:
//       default:
//         return 'assets/images/hogwarts_bg.jpg';
//     }
//   }

//   // Helper method to get the main crest image based on the selected house
//   String _getMainCrestImage(HogwartsHouse house) {
//     switch (house) {
//       case HogwartsHouse.gryffindor:
//         return 'assets/images/gryffindor_crest.png'; // Full Gryffindor crest
//       case HogwartsHouse.slytherin:
//         return 'assets/images/slytherin_crest.png'; // Full Slytherin crest
//       case HogwartsHouse.ravenclaw:
//         return 'assets/images/ravenclaw_crest.png'; // Full Ravenclaw crest
//       case HogwartsHouse.hufflepuff:
//         return 'assets/images/hufflepuff_crest.png'; // Full Hufflepuff crest
//       case HogwartsHouse.none:
//       default:
//         return 'assets/images/hogwarts_crest.png'; // Default Hogwarts crest
//     }
//   }

//   // Helper method to get a primary accent color based on the selected house
//   Color _getAccentColor(HogwartsHouse house) {
//     switch (house) {
//       case HogwartsHouse.gryffindor:
//         return const Color(0xFFC50000); // Darker red for Gryffindor
//       case HogwartsHouse.slytherin:
//         return const Color(0xFF1A472A); // Darker green for Slytherin
//       case HogwartsHouse.ravenclaw:
//         return const Color(0xFF222F5B); // Darker blue for Ravenclaw
//       case HogwartsHouse.hufflepuff:
//         return const Color(0xFFFFDB00); // Darker yellow/gold for Hufflepuff
//       default:
//         return const Color(0xFF785834); // A dark brown for default
//     }
//   }

//   // Helper method to get a secondary/light accent color (e.g., for icons/text)
//   Color _getLightAccentColor(HogwartsHouse house) {
//     switch (house) {
//       case HogwartsHouse.gryffindor:
//         return const Color(0xFFEEBA30); // Gold
//       case HogwartsHouse.slytherin:
//         return const Color(0xFFAAA5A5); // Silver
//       case HogwartsHouse.ravenclaw:
//         return const Color(0xFF946B0C); // Bronze
//       case HogwartsHouse.hufflepuff:
//         return Colors.black; // Black or dark brown for Hufflepuff text on gold
//       default:
//         return Colors.white70;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final String backgroundImage = _getBackgroundImage(selectedHouse);
//     final String mainCrestImage = _getMainCrestImage(selectedHouse);
//     final Color accentColor = _getAccentColor(selectedHouse);
//     final Color lightAccentColor = _getLightAccentColor(selectedHouse);
//     final String houseName = selectedHouse.toString().split('.').last;

//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background Image with Overlay
//           Positioned.fill(
//             child: ColorFiltered(
//               // Use ColorFiltered to apply the color filter
//               colorFilter: ColorFilter.mode(
//                 Colors.black.withOpacity(0.5), // Dark overlay for readability
//                 BlendMode.darken,
//               ),
//               child: Image.asset(
//                 backgroundImage,
//                 fit: BoxFit.cover,
//                 // colorBlendMode: BlendMode.darken, // This line is not needed here anymore
//                 // color: Colors.black.withOpacity(0.5), // This line is not needed here anymore
//               ),
//             ),
//           ),
//           // Gradient Overlay to ensure top/bottom are darker
//           Positioned.fill(
//             child: Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Colors.black.withOpacity(0.7), // Dark at the top
//                     Colors.transparent, // Transparent in the middle
//                     Colors.black.withOpacity(0.7), // Dark at the bottom
//                   ],
//                   stops: const [0.0, 0.4, 1.0],
//                 ),
//               ),
//             ),
//           ),
//           SafeArea(
//             child: Column(
//               children: [
//                 // Top Bar with Back Button and Hogwarts Crest
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       IconButton(
//                         icon: Icon(
//                           Icons.arrow_back,
//                           color: lightAccentColor,
//                           size: 30,
//                         ),
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         },
//                       ),
//                       // Replace with your actual small crest image
//                       Image.asset(
//                         'assets/images/hogwarts_crest.png', // Or another suitable crest
//                         height: 40,
//                         color: lightAccentColor, // Tint with house accent color
//                       ),
//                     ],
//                   ),
//                 ),
//                 // Harry Potter Character Image (from design)
//                 SizedBox(
//                   height:
//                       MediaQuery.of(context).size.height *
//                       0.35, // Adjust height as needed
//                   child: Center(
//                     child: ColorFiltered(
//                       // Apply ColorFiltered here as well
//                       colorFilter: ColorFilter.mode(
//                         Colors.white.withOpacity(
//                           0.8,
//                         ), // Example: subtle desaturation
//                         BlendMode.modulate,
//                       ),
//                       child: Image.asset(
//                         mainCrestImage, // <--- Change this line
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Watch Series Button
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 20.0,
//                     vertical: 10.0,
//                   ),
//                   child: ElevatedButton.icon(
//                     onPressed: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) => const SeriesScreen(),
//                         ),
//                       );
//                     },
//                     icon: const Icon(
//                       Icons.play_circle_fill,
//                       color: Colors.white,
//                     ),
//                     label: const Text(
//                       'Watch Series',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontFamily: 'NotoSerif',
//                       ),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: accentColor.withOpacity(
//                         0.8,
//                       ), // House color with transparency
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30),
//                         side: BorderSide(
//                           color: lightAccentColor.withOpacity(0.7),
//                           width: 1,
//                         ), // Subtle border
//                       ),
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 30,
//                         vertical: 15,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 // Welcome Text
//                 Text(
//                   'Welcome to Wizarding School!',
//                   style: TextStyle(
//                     fontFamily: 'NotoSerif',
//                     fontSize: 24,
//                     color: Colors.white,
//                     shadows: [
//                       Shadow(
//                         blurRadius: 10.0,
//                         color: Colors.black.withOpacity(0.8),
//                         offset: const Offset(2, 2),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 // House Name
//                 Text(
//                   'Houses of Hogwarts School',
//                   style: TextStyle(
//                     fontFamily: 'NotoSerif',
//                     fontSize: 18,
//                     fontStyle: FontStyle.italic,
//                     color: lightAccentColor.withOpacity(0.8),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 // Menu Grid
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: GridView.count(
//                       crossAxisCount: 4, // 4 items per row as per design
//                       crossAxisSpacing: 15, // Spacing between columns
//                       mainAxisSpacing: 15, // Spacing between rows
//                       padding: const EdgeInsets.all(
//                         0,
//                       ), // No extra padding for the grid
//                       children: [
//                         _buildMenuItem(
//                           context,
//                           'Houses',
//                           'assets/images/cat.png', // Generic house icon
//                           () {
//                             // Go back to house selection
//                             Navigator.of(context).pushReplacement(
//                               MaterialPageRoute(
//                                 builder:
//                                     (context) => const HouseSelectionScreen(),
//                               ),
//                             );
//                           },
//                           lightAccentColor,
//                         ),
//                         _buildMenuItem(
//                           context,
//                           'Characters',
//                           'assets/images/cat.png', // Representing `CharacterModel`
//                           () {
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder:
//                                     (context) => CharactersScreen(
//                                       selectedHouse: selectedHouse,
//                                     ),
//                               ),
//                             );
//                           },
//                           lightAccentColor,
//                         ),
//                         _buildMenuItem(
//                           context,
//                           'Symbols',
//                           'assets/images/cat.png', // Represents various symbols/emblems (House Crests, Patronus, etc.)
//                           () {
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder: (context) => const SymbolsScreen(),
//                               ),
//                             );
//                           },
//                           lightAccentColor,
//                         ),
//                         _buildMenuItem(
//                           context,
//                           'Spells',
//                           'assets/images/cat.png', // Represents spells (could be separate API or hardcoded)
//                           () {
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder: (context) => const SpellsScreen(),
//                               ),
//                             );
//                           },
//                           lightAccentColor,
//                         ),
//                         _buildMenuItem(
//                           context,
//                           'Wands',
//                           'assets/images/cat.png', // Represents `Wand` from CharacterModel or a dedicated wand API
//                           () {
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder: (context) => const WandsScreen(),
//                               ),
//                             );
//                           },
//                           lightAccentColor,
//                         ),
//                         _buildMenuItem(
//                           context,
//                           'Places',
//                           'assets/images/cat.png', // Represents locations in HP world
//                           () {
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder: (context) => const PlacesScreen(),
//                               ),
//                             );
//                           },
//                           lightAccentColor,
//                         ),
//                         _buildMenuItem(
//                           context,
//                           'Letters',
//                           'assets/images/cat.png', // Could be for letters like acceptance letter etc.
//                           () {
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder: (context) => const LettersScreen(),
//                               ),
//                             );
//                           },
//                           lightAccentColor,
//                         ),
//                         _buildMenuItem(
//                           context,
//                           'Send Letter',
//                           'assets/images/cat.png', // A hypothetical feature
//                           () {
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder: (context) => const SendLetterScreen(),
//                               ),
//                             );
//                           },
//                           lightAccentColor,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Helper widget to build a single menu item
//   Widget _buildMenuItem(
//     BuildContext context,
//     String title,
//     String iconPath,
//     VoidCallback onTap,
//     Color iconColor,
//   ) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.black.withOpacity(
//             0.5,
//           ), // Dark translucent background for each icon
//           borderRadius: BorderRadius.circular(15), // Rounded corners
//           border: Border.all(
//             color: iconColor.withOpacity(0.3),
//             width: 1,
//           ), // Subtle border
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               iconPath,
//               height: 40, // Icon size
//               color: iconColor, // Tint icon with accent color
//             ),
//             const SizedBox(height: 8),
//             Text(
//               title,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontFamily: 'NotoSerif',
//                 fontSize: 12,
//                 color: iconColor, // Text color
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }