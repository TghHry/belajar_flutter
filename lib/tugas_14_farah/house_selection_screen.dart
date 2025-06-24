// lib/screens/house_selection_screen.dart
import 'package:flutter/material.dart';
// import 'package:ppkdjp_flutter/constant/app_image.dart';
// import 'package:ppkdjp_flutter/harry_potter/api/hp_api.dart' as api_service;
// import 'package:ppkdjp_flutter/harry_potter/models/character_model.dart';
// import 'package:ppkdjp_flutter/harry_potter/screens/home_screen.dart';
import 'package:belajar_flutter2/constant/app_image_farah.dart';
import 'package:belajar_flutter2/tugas_14_farah/model/model.dart';
import 'package:belajar_flutter2/tugas_14_farah/api/api.dart' as api_service;
import 'package:belajar_flutter2/tugas_14_farah/home_screen.dart';


enum HogwartsHouse { gryffindor, slytherin, ravenclaw, hufflepuff, none }

class HouseSelectionScreen extends StatefulWidget {
  const HouseSelectionScreen({Key? key}) : super(key: key);

  @override
  State<HouseSelectionScreen> createState() => _HouseSelectionScreenState();
}

class _HouseSelectionScreenState extends State<HouseSelectionScreen> {
  HogwartsHouse _selectedHouse = HogwartsHouse.none;
  bool _isLoading = false;

  final GlobalKey _gryffindorKey = GlobalKey();
  final GlobalKey _slytherinKey = GlobalKey();
  final GlobalKey _ravenclawKey = GlobalKey();
  final GlobalKey _hufflepuffKey = GlobalKey();

  late Map<HogwartsHouse, GlobalKey> _houseKeys;

  @override
  void initState() {
    super.initState();
    _houseKeys = {
      HogwartsHouse.gryffindor: _gryffindorKey,
      HogwartsHouse.slytherin: _slytherinKey,
      HogwartsHouse.ravenclaw: _ravenclawKey,
      HogwartsHouse.hufflepuff: _hufflepuffKey,
    };
  }

  void _selectHouse(HogwartsHouse house) {
    setState(() {
      _selectedHouse = house;
    });
  }

  Future<HogwartsHouse> _confirmHouseViaApi(
    HogwartsHouse selectedHouseClient,
  ) async {
    setState(() {
      _isLoading = true;
    });

    final String houseName = selectedHouseClient.toString().split('.').last;

    try {
      final List<CharacterModel> characters = await api_service
          .getCharactersByHouse(houseName);

      if (characters.isNotEmpty) {
        return selectedHouseClient;
      } else {
        print('API returned no characters for house: $houseName');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'No characters found for this house. Please try another.',
            ),
          ),
        );
        return HogwartsHouse.none;
      }
    } catch (e) {
      print('Error confirming house with API: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'An error occurred during house confirmation. Please try again.',
          ),
        ),
      );
      return HogwartsHouse.none;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Helper to get the position and size of the selected house icon
  Rect? _getWandTargetRect() {
    if (_selectedHouse == HogwartsHouse.none) return null;

    final RenderBox? renderBox =
        _houseKeys[_selectedHouse]?.currentContext?.findRenderObject()
            as RenderBox?;
    if (renderBox == null) return null;

    final size = renderBox.size;
    final position = renderBox.localToGlobal(Offset.zero);

    // Return the global rectangle of the target widget
    return Rect.fromLTWH(position.dx, position.dy, size.width, size.height);
  }

  BoxBorder? _getHouseBorder(HogwartsHouse house) {
    if (_selectedHouse == house) {
      return Border.all(color: Colors.amber, width: 3.0);
    }
    return null;
  }

  Widget _buildHouseItem(
    HogwartsHouse house,
    String imagePath,
    String houseName,
    GlobalKey key,
  ) {
    return GestureDetector(
      key: key,
      onTap: () => _selectHouse(house),
      child: Container(
        width: 80,
        height: 80,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(10.0),
          border: _getHouseBorder(house),
          boxShadow:
              _selectedHouse == house
                  ? [
                    BoxShadow(
                      color: Colors.amber.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 3,
                    ),
                  ]
                  : null,
        ),
        child: Image.asset(imagePath, fit: BoxFit.contain),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Color(0xFFEADDCA);
    const Color textColor = Color(0xFF3E2723);

    final Rect? wandTargetRect = _getWandTargetRect();

    // Define wand cursor dimensions
    const double wandCursorWidth = 80;
    const double wandCursorHeight = 80;

    // Calculate the animated position for the wand
    double wandLeft = 0;
    double wandTop = 0;
    bool showWand = false;

    if (wandTargetRect != null) {
      // Adjust these offsets to precisely place the wand's tip relative to the target rect's center.
      // The wand cursor in the image appears slightly above and to the left of the center of the icon.
      wandLeft =
          wandTargetRect.center.dx -
          (wandCursorWidth / 2) -
          40; // -40 to shift left
      wandTop =
          wandTargetRect.center.dy -
          (wandCursorHeight / 2) -
          -20; // 20 to shift up
      showWand = true;
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).padding.top + 20),

                  Image.asset(
                    AppImage.hogwarts,
                    height: 80,
                    colorBlendMode: BlendMode.modulate,
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    'Please choose one of the four houses of\nHogwarts School of Witchcraft and Wizardry.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'NotoSerif',
                      fontSize: 20,
                      color: textColor,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Text(
                    'After all this time?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'NotoSerif',
                      fontSize: 14,
                      color: textColor.withOpacity(0.7),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 30),

                  Column(
                    children: [
                      _buildHouseItem(
                        HogwartsHouse.gryffindor,
                        AppImage.gryffindor,
                        'Gryffindor',
                        _gryffindorKey,
                      ),
                      _buildHouseItem(
                        HogwartsHouse.slytherin,
                        AppImage.slytherin,
                        'Slytherin',
                        _slytherinKey,
                      ),
                      _buildHouseItem(
                        HogwartsHouse.ravenclaw,
                        AppImage.ravenclaw,
                        'Ravenclaw',
                        _ravenclawKey,
                      ),
                      _buildHouseItem(
                        HogwartsHouse.hufflepuff,
                        AppImage.hufflepuff,
                        'Hufflepuff',
                        _hufflepuffKey,
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  ElevatedButton(
                    onPressed:
                        (_selectedHouse != HogwartsHouse.none && !_isLoading)
                            ? () async {
                              HogwartsHouse confirmedHouse =
                                  await _confirmHouseViaApi(_selectedHouse);
                              if (confirmedHouse != HogwartsHouse.none) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder:
                                        (context) => HomeScreen(
                                          selectedHouse: confirmedHouse,
                                        ),
                                  ),
                                );
                              }
                            }
                            : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber[700],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      textStyle: const TextStyle(
                        fontFamily: 'NotoSerif',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child:
                        _isLoading
                            ? const CircularProgressIndicator(
                              color: Color.fromARGB(255, 5, 1, 1),
                            )
                            : const Text('Choose and Continue'),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          // --- Corrected Wand Cursor Overlay ---
          if (showWand) // Only show the AnimatedPositioned if wand position is calculated
            AnimatedPositioned(
              left: wandLeft,
              top: wandTop,
              width: wandCursorWidth,
              height: wandCursorHeight,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Image.asset(AppImage.wandCursor, fit: BoxFit.contain),
            ),
        ],
      ),
    );
  }
}