import 'package:flutter/material.dart';
import 'package:belajar_flutter2/constant/app_color.dart';
import 'package:belajar_flutter2/constant/app_style.dart';
import 'package:belajar_flutter2/tugas_15_farah/screen/register_screen.dart';
import 'package:belajar_flutter2/tugas_15_farah/screen/login%20_screen.dart';
import 'package:belajar_flutter2/tugas_15_farah/screen/custom_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image Placeholder (You'll replace this with your actual image)
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Placeholder color
                  borderRadius: BorderRadius.circular(12),
               
                ),
                child: Center(
                  child: Text(
                    'Your Welcome Illustration Here',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              ),
              const SizedBox(height: 48.0),
              Text(
                'Welcome to',
                style: AppStyle.heading1, // Changed to AppStyle
              ),
              Text(
                'SeekJob',
                style: AppStyle.heading2.copyWith(
                  color: AppColor.primaryBlack,
                ), // Changed to AppStyle and AppColor
              ),
              const SizedBox(height: 16.0),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                textAlign: TextAlign.center,
                style: AppStyle.bodyText, // Changed to AppStyle
              ),
              const SizedBox(height: 48.0),
              CustomButton(
                text: 'Login',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                backgroundColor: AppColor.primaryBlack, // Changed to AppColor
                textColor: Colors.white,
              ),
              const SizedBox(height: 16.0),
              CustomButton(
                text: 'Register',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ), // Navigate to Register screen
                  );
                },
                backgroundColor: AppColor.lightGrey, // Changed to AppColor
                textColor: AppColor.primaryBlack, // Changed to AppColor
              ),
            ],
          ),
        ),
      ),
    );
  }
}
