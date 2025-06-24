import 'package:flutter/material.dart';
// import 'package:ppkdjp_flutter/constant/app_image.dart';
import 'package:belajar_flutter2/constant/app_image_farah.dart';
import 'dart:async';
import 'package:belajar_flutter2/tugas_14_farah/house_selection_screen.dart';
// import 'package:ppkdjp_flutter/harry_potter/screens/house_selection_screen.dart'; // Required for Future.delayed

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _wandGlowAnimation;

  bool _animationCompleted = false; // Flag to enable navigation
  bool _showTapToStartText =
      false; // Flag to control "tap to start" text visibility

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller for the wand glow and crest reveal
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ), // Duration for one full cycle (e.g., bright to dim)
    );

    // Define the animation for the wand's glow and the crest's opacity
    _wandGlowAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves
            .easeInOut, // Provides a smooth ease-in and ease-out for pulsing
      ),
    );

    // Start the animation to repeat continuously, reversing direction each time
    // This creates the "on/off" or "pulsing" effect for the light
    _animationController.repeat(reverse: true);

    // Use a Future.delayed to control when the "tap anywhere to start" text appears
    // and when the screen becomes interactable. This ensures it happens after a fixed time,
    // regardless of the repeating animation's current cycle.
    Future.delayed(const Duration(seconds: 3), () {
      // Text will appear after 3 seconds
      if (mounted) {
        // Check if the widget is still in the widget tree
        setState(() {
          _showTapToStartText =
              true; // Set flag to make the "tap to start" text visible
          _animationCompleted = true; // Set flag to allow navigation via tap
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController
        .dispose(); // Dispose the controller to prevent memory leaks
    super.dispose();
  }

  // Function to navigate to the home screen
  void _navigateToHomeScreen() {
    if (_animationCompleted) {
      // Only navigate if the initial animation sequence has finished
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HouseSelectionScreen(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color goldColor = Color(
      0xFFFFD700,
    ); // Define a gold color for the glow
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: GestureDetector(
        // Allows tapping anywhere on the screen
        onTap: _navigateToHomeScreen, // Calls navigation function on tap
        child: Container(
          width:
              double.infinity, // Ensure the background fills the entire width
          height:
              double.infinity, // Ensure the background fills the entire height
          // Set a solid background color
          decoration: const BoxDecoration(
            color: Color(0xFF121212), // A very dark grey color
          ),
          child: Stack(
            // Allows layering of widgets on top of each other
            alignment:
                Alignment.center, // Centers children in the stack by default
            children: [
              // 1. Hogwarts Crest Image
              Positioned(
                top: screenHeight *
                    0.13, // Position 15% down from the top of the screen
                width: screenWidth * 0.8, // Crest width as 80% of screen width
                child: AnimatedBuilder(
                  animation:
                      _wandGlowAnimation, // Crest opacity follows wand glow animation
                  builder: (context, child) {
                    // Calculate crest opacity: starts at 0.3 (30%) and goes up to 1.0 (100%)
                    // This ensures the crest is always somewhat visible, even when the glow is dim.
                    final double crestOpacity =
                        _wandGlowAnimation.value * 0.7 + 0.3;
                    return Opacity(
                      opacity: crestOpacity,
                      child: Image.asset(
                        AppImage.hogwarts, // Path to your Hogwarts crest image
                        fit: BoxFit
                            .contain, // Ensures the image fits within its bounds
                      ),
                    );
                  },
                ),
              ),

              // 2. The Wand Image
              Positioned(
                // Position the wand's bottom edge slightly off-screen
                // Adjust this value if you want more or less of the handle visible.
                bottom: -screenHeight * 0.1,
                width: screenWidth * 0.4, // Wand width as 40% of screen width
                height: screenHeight,
                child: Image.asset(
                  'assets/images/wand.png', // Path to your wand image (without any built-in glow)
                  fit: BoxFit.contain,
                ),
              ),

              // 3. Wand Glow Effect (positioned precisely on the wand's tip)
              AnimatedBuilder(
                animation:
                    _wandGlowAnimation, // Glow animation is driven by the same controller
                builder: (context, child) {
                  final double currentGlowValue = _wandGlowAnimation.value;
                  // Calculate glow intensity: min 0.2, max 1.0 opacity
                  final double glowIntensity = currentGlowValue * 0.8 + 0.2;
                  // Calculate glow size: base size 40.0, increases by up to 40
                  final double glowSize = 40.0 + (currentGlowValue * 40);

                  return Positioned(
                    // --- CRITICAL ALIGNMENT POINT ---
                    // This 'bottom' value precisely positions the glow on the wand's tip.
                    // You might need to slightly fine-tune this value based on your specific 'wand.png'
                    // image's proportions and transparency around its tip.
                    bottom: screenHeight *
                        0.64, // Adjusted to move it down slightly
                    // Horizontally center the glow relative to its own dynamic size
                    left: screenWidth / 2 - (glowSize / 2),
                    child: Opacity(
                      opacity: glowIntensity,
                      child: Container(
                        width: glowSize,
                        height: glowSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              Colors.white, // Bright center of the glow
                              // Gold outer glow, with alpha based on current animation value
                              Color.fromARGB(
                                (255 * currentGlowValue).round(),
                                goldColor.red,
                                goldColor.green,
                                goldColor.blue,
                              ),
                              Colors
                                  .transparent, // Fades to transparent at the edge
                            ],
                            stops: const [0.0, 0.5, 1.0], // Gradient stops
                          ),
                          boxShadow: [
                            BoxShadow(
                              // Shadow color based on gold and animation value
                              color: Color.fromARGB(
                                (255 * currentGlowValue * 0.7).round(),
                                goldColor.red,
                                goldColor.green,
                                goldColor.blue,
                              ),
                              blurRadius: glowSize /
                                  2, // Blur radius relative to glow size
                              spreadRadius: glowSize /
                                  4, // Spread radius relative to glow size
                              offset: const Offset(
                                0,
                                0,
                              ), // No offset for the shadow
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),

              // 4. "Tap anywhere to start" Text
              Positioned(
                bottom: screenHeight *
                    0.05, // Position 5% up from the bottom of the screen
                child: AnimatedOpacity(
                  // Opacity is controlled by _showTapToStartText flag: fades in when true
                  opacity: _showTapToStartText ? 1.0 : 0.0,
                  duration: const Duration(
                    milliseconds: 500,
                  ), // Smooth fade-in duration
                  child: Text(
                    'tap anywhere to start',
                    style: TextStyle(
                      fontFamily:
                          'NotoSerif', // Example font, ensure it's in your pubspec.yaml
                      fontSize: 18,
                      color: Color.fromARGB(
                        (255 * 0.7).round(),
                        Colors.white.red,
                        Colors.white.green,
                        Colors.white.blue,
                      ),
                      shadows: [
                        // Subtle text shadow for readability
                        Shadow(
                          blurRadius: 8.0,
                          color: Color.fromARGB(
                            (255 * 0.3).round(),
                            Colors.white.red,
                            Colors.white.green,
                            Colors.white.blue,
                          ),
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
