import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:belajar_flutter2/constant/app_color.dart';
import 'package:belajar_flutter2/constant/app_style.dart';
import 'package:belajar_flutter2/tugas_15_farah/screen/custom_button.dart';
import 'package:belajar_flutter2/tugas_15_farah/models/error_response_model.dart';
import 'package:belajar_flutter2/tugas_15_farah/screen/profil_screen.dart';
import 'package:belajar_flutter2/tugas_15_farah/screen/register_screen.dart';
import 'package:belajar_flutter2/tugas_15_farah/services/api_services.dart';
import 'package:belajar_flutter2/tugas_15_farah/screen/social_login_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(); // Key for the form
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  final ApiService _apiService = ApiService(); // Instantiate ApiService
  bool _isLoading = false;

  // Map to hold validation errors for each field
  Map<String, String?> _errors = {'email': null, 'password': null};

  // Helper to clear a specific error message
  void _clearError(String field) {
    if (_errors[field] != null) {
      setState(() {
        _errors[field] = null;
      });
    }
  }

  // Handle API errors and set specific field errors
  void _handleApiError(dynamic e) {
    String errorMessage = 'An unexpected error occurred.';
    if (e is Exception) {
      String exceptionMessage = e.toString().replaceFirst('Exception: ', '');
      try {
        if (exceptionMessage.startsWith('{') &&
            exceptionMessage.endsWith('}')) {
          final Map<String, dynamic> errorJson = jsonDecode(exceptionMessage);
          final errorResponse = ErrorResponse.fromJson(errorJson);

          errorMessage = errorResponse.message;

          setState(() {
            errorResponse.errors?.forEach((field, messages) {
              if (_errors.containsKey(field)) {
                _errors[field] = messages.join(', ');
              }
            });
          });
        } else {
          errorMessage = exceptionMessage;
        }
      } catch (_) {
        errorMessage = exceptionMessage; // Fallback if JSON parsing fails
      }
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(errorMessage)));
  }

  void _login() async {
    // Clear previous errors before validation
    setState(() {
      _errors = {'email': null, 'password': null};
    });

    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        final response = await _apiService.login(
          email: _emailController.text,
          password: _passwordController.text,
        );
        // Login successful, navigate to ProfileScreen
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(response.message)));
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
          (Route<dynamic> route) => false,
        );
      } catch (e) {
        // Handle login error
        _handleApiError(e);
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColor.primaryBlack),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),
                Text('Let\'s Sign you in.', style: AppStyle.heading1),
                const SizedBox(height: 8.0),
                Text('Welcome back', style: AppStyle.subHeading),
                Text('You\'ve been missed!', style: AppStyle.subHeading),
                const SizedBox(height: 48.0),
                Text('Email', style: AppStyle.inputLabel),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (_) =>
                      _clearError('email'), // Clear error on change
                  decoration: InputDecoration(
                    hintText: 'Enter your Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: AppColor.lightGrey,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    errorText: _errors['email'], // Display validation error
                    errorMaxLines: 2, // Allow error text to wrap
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address.';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email address.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24.0),
                Text('Password', style: AppStyle.inputLabel),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  onChanged: (_) =>
                      _clearError('password'), // Clear error on change
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: AppColor.lightGrey,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColor.iconGrey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    errorText: _errors['password'], // Display validation error
                    errorMaxLines: 2,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24.0),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 0.8,
                        indent: 20,
                        endIndent: 10,
                      ),
                    ),
                    Text(
                      'or',
                      style: AppStyle.bodyText.copyWith(
                        color: AppColor.iconGrey,
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 0.8,
                        indent: 10,
                        endIndent: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),
                const SocialLoginButtons(),
                const SizedBox(height: 48.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: AppStyle.bodyText.copyWith(
                        color: AppColor.primaryBlack,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print('Register tapped from login');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Register',
                        style: AppStyle.bodyText.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryBlack,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : CustomButton(
                        text: 'Login',
                        onPressed: _login, // Call the login method
                        backgroundColor: AppColor.primaryBlack,
                        textColor: Colors.white,
                      ),
                const SizedBox(height: 24.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
