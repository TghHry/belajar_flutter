import 'package:flutter/material.dart';
import 'package:belajar_flutter2/tugas_15_farah/screen/profil_screen.dart';
import 'package:belajar_flutter2/tugas_15_farah/services/api_services.dart';
import 'package:belajar_flutter2/tugas_15_farah/screen/welcome_screen.dart';

class AuthCheckScreen extends StatefulWidget {
  const AuthCheckScreen({super.key});

  @override
  State<AuthCheckScreen> createState() => _AuthCheckScreenState();
}

class _AuthCheckScreenState extends State<AuthCheckScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    final ApiService apiService = ApiService();
    try {
      // Attempt to get the user's profile.
      // If the token is valid and still active on the backend, this will succeed.
      // The ApiService.getProfile method already handles cleaning up the token
      // if the backend returns a 401 (Unauthenticated).
      await apiService.getProfile();

      // If getProfile succeeds, it means the user is logged in.
      // Navigate to the ProfileScreen and replace the current route.
      if (mounted) {
        // Ensure widget is still in the tree before navigating
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        );
      }
    } catch (e) {
      // If getProfile fails (e.g., no token, expired token, network error),
      // navigate to the WelcomeScreen.
      if (mounted) {
        // Ensure widget is still in the tree before navigating
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const WelcomeScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Show a loading indicator while checking auth status
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}