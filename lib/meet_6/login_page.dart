import 'package:flutter/material.dart';

class ModernLoginPage extends StatelessWidget {
  const ModernLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF001F54), // Dark Blue Background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),

              // Top back arrow and "Login"
              Row(
                children: const [
                  Icon(Icons.arrow_back, color: Colors.white),
                  SizedBox(width: 16),
                  Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),

              const SizedBox(height: 60),

              // Welcome Text
              const Text(
                "Hello Welcome Back",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Welcome back please\nsign in again",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 40),

              // Email Field
              const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email, color: Colors.white),
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.white70),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white54),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Password Field
              const TextField(
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: Colors.white),
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.white70),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white54),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Login Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    // Handle login
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Color(0xFF001F54),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // OR Divider
              Row(
                children: const [
                  Expanded(child: Divider(color: Colors.white24)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("or", style: TextStyle(color: Colors.white70)),
                  ),
                  Expanded(child: Divider(color: Colors.white24)),
                ],
              ),
              const SizedBox(height: 24),

              // Facebook Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.facebook, color: Colors.white),
                  label: const Text("Facebook"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF153F7C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 16),

              // Google Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  icon: Image.asset(
                    'assets/images/google.png',
                    height: 24,
                    width: 24,
                  ),
                  label: const Text("Gmail"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF153F7C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),

              const Spacer(),

              // Sign Up Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account ? ",
                    style: TextStyle(color: Colors.white70),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to Sign Up
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
