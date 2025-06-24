import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:belajar_flutter2/constant/app_color.dart';
import 'package:belajar_flutter2/constant/app_style.dart';
import 'package:belajar_flutter2/tugas_15_farah/screen/custom_button.dart';
import 'package:belajar_flutter2/tugas_15_farah/screen/login%20_screen.dart';
import 'package:belajar_flutter2/tugas_15_farah/models/error_response_model.dart';
import 'package:belajar_flutter2/tugas_15_farah/services/api_services.dart';
import 'package:belajar_flutter2/tugas_15_farah/screen/social_login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Key for the Form widget
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  final ApiService _apiService = ApiService();
  bool _isLoading = false;

  Map<String, String?> _serverErrors = {
    'name': null,
    'email': null,
    'password': null,
  };

  // Centralized API error handling
  void _handleApiError(dynamic e) {
    String snackBarMessage =
        'Registration Failed: An unexpected error occurred.';

    if (e is Exception) {
      String exceptionMessage = e.toString().replaceFirst('Exception: ', '');

      // Attempt to remove "API Error: [status code] - " prefix if present from generic fallback
      if (exceptionMessage.startsWith('API Error:')) {
        int dashIndex = exceptionMessage.indexOf(' - ');
        if (dashIndex != -1) {
          exceptionMessage = exceptionMessage.substring(dashIndex + 3).trim();
        }
      }

      // Logic to unescape/unquote the string if it looks like a quoted JSON string
      // This handles cases where the backend/proxy accidentally double-quotes the JSON response.
      if (exceptionMessage.startsWith('"') &&
          exceptionMessage.endsWith('"') &&
          exceptionMessage.length > 1) {
        try {
          // Attempt to decode it once. If successful, it means the entire string
          // was a JSON string literal. The result is the actual inner string.
          String innerJsonString = json.decode(exceptionMessage);
          exceptionMessage = innerJsonString;
        } catch (_) {
          // If this fails, it means it wasn't a valid JSON string wrapped in quotes,
          // so we keep the original exceptionMessage.
        }
      }

      try {
        // Now, try to parse the (potentially unquoted) exceptionMessage as a JSON object
        if (exceptionMessage.startsWith('{') &&
            exceptionMessage.endsWith('}')) {
          final Map<String, dynamic> errorJson = jsonDecode(exceptionMessage);
          final errorResponse = ErrorResponse.fromJson(errorJson);

          snackBarMessage = errorResponse.message;

          setState(() {
            _serverErrors = {
              'name': null,
              'email': null,
              'password': null,
            }; // Clear previous server errors

            errorResponse.errors?.forEach((field, messages) {
              if (_serverErrors.containsKey(field)) {
                _serverErrors[field] = messages.join(', ');
              }
            });
          });
        } else {
          // This block is for simple string messages that are not JSON objects
          // (e.g., "Unauthenticated. Please log in again.", or the raw unquoted body if initial decode failed)
          snackBarMessage = exceptionMessage;
        }
      } catch (_) {
        // Fallback for any decoding issues within the try block
        snackBarMessage = exceptionMessage;
      }
    }

    // Add a debug print to see the final message going to the SnackBar
    print('SnackBar Message: $snackBarMessage');
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(snackBarMessage)));
  }

  void _register() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
      _serverErrors = {'name': null, 'email': null, 'password': null};
    });

    try {
      final response = await _apiService.register(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(response.message)));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } catch (e) {
      _handleApiError(e);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  String? _nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama wajib diisi.';
    }
    if (_serverErrors['name'] != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _serverErrors['name'] = null;
        });
      });
    }
    return null;
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email wajib diisi.';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Email tidak valid.';
    }
    if (_serverErrors['email'] != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _serverErrors['email'] = null;
        });
      });
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password wajib diisi.';
    }
    if (value.length < 8) {
      return 'Password minimal 8 karakter.';
    }
    bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
    bool hasLowercase = value.contains(RegExp(r'[a-z]'));
    bool hasDigit = value.contains(RegExp(r'\d'));
    bool hasSpecialChar = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    if (!hasUppercase || !hasLowercase || (!hasDigit && !hasSpecialChar)) {
      return 'Password harus ada huruf besar, kecil & angka/simbol.';
    }
    if (_serverErrors['password'] != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _serverErrors['password'] = null;
        });
      });
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back, color: AppColor.primaryBlack),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
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
                Text('Create Your Account', style: AppStyle.heading1),
                const SizedBox(height: 8.0),
                Text(
                  'Join us to find your dream job!',
                  style: AppStyle.subHeading,
                ),
                const SizedBox(height: 48.0),
                Text('Name', style: AppStyle.inputLabel),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: _nameController,
                  validator: _nameValidator,
                  decoration: InputDecoration(
                    hintText: 'Enter your Name',
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
                    errorText: _serverErrors['name'],
                    errorMaxLines: 2,
                  ),
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 24.0),
                Text('Email', style: AppStyle.inputLabel),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: _emailController,
                  validator: _emailValidator,
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
                    errorText: _serverErrors['email'],
                    errorMaxLines: 2,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24.0),
                Text('Password', style: AppStyle.inputLabel),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  validator: _passwordValidator,
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
                    errorText: _serverErrors['password'],
                    errorMaxLines: 3,
                  ),
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
                      'Already have an account? ',
                      style: AppStyle.bodyText.copyWith(
                        color: AppColor.primaryBlack,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print('Login tapped from register');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Login',
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
                        text: 'Register',
                        onPressed: _register,
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
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
