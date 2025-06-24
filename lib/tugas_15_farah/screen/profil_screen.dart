import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:belajar_flutter2/constant/app_color.dart';
import 'package:belajar_flutter2/constant/app_style.dart';
import 'package:belajar_flutter2/tugas_15_farah/screen/custom_button.dart';
import 'package:belajar_flutter2/tugas_15_farah/models/error_response_model.dart';
import 'package:belajar_flutter2/tugas_15_farah/models/user_model.dart';
import 'package:belajar_flutter2/tugas_15_farah/services/api_services.dart';
import 'package:belajar_flutter2/tugas_15_farah/screen/welcome_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ApiService _apiService = ApiService();
  User? _currentUser;
  bool _isLoading = false;
  bool _isEditingProfile =
  false; // To toggle between view and edit profile mode

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // Errors for profile fields
  Map<String, String?> _profileErrors = {'name': null, 'email': null};

  @override
  void initState() {
    super.initState();
    _fetchProfile();
  }

  Future<void> _fetchProfile() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final user = await _apiService.getProfile();
      setState(() {
        _currentUser = user;
        _nameController.text = user.name;
        _emailController.text = user.email;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Failed to fetch profile: ${e.toString().replaceFirst('Exception: ', '')}',
          ),
        ),
      );
      if (e.toString().contains('Unauthenticated')) {
        _logout();
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _clearProfileFieldError(String field) {
    if (_profileErrors[field] != null) {
      setState(() {
        _profileErrors[field] = null;
      });
    }
  }

  Future<void> _updateProfile() async {
    setState(() {
      _isLoading = true;
      _profileErrors = {
        'name': null,
        'email': null,
      }; // Clear errors before submit
    });
    try {
      final updatedUser = await _apiService.updateProfile(
        name: _nameController.text,
      );
      setState(() {
        _currentUser = updatedUser;
        _isEditingProfile = false; // Exit edit mode on successful update
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully!')),
      );
    } catch (e) {
      _handleApiError(e, _profileErrors);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Centralized API error handling
  void _handleApiError(dynamic e, Map<String, String?> errorMap) {
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
              if (errorMap.containsKey(field)) {
                errorMap[field] = messages.join(', ');
              }
            });
          });
        } else {
          errorMessage = exceptionMessage;
        }
      } catch (_) {
        errorMessage = exceptionMessage;
      }
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(errorMessage)));
  }

  Future<void> _logout() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await _apiService.logout();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Logged out successfully!')));
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Logout failed: ${e.toString().replaceFirst('Exception: ', '')}',
          ),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _deleteAccount() async {
    final bool? confirm = await showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Delete Account'),
          content: const Text(
            'Are you sure you want to delete your account? This action cannot be undone.',
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop(false);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text('Delete'),
              onPressed: () {
                Navigator.of(dialogContext).pop(true);
              },
            ),
          ],
        );
      },
    );

    if (confirm == true) {
      setState(() {
        _isLoading = true;
      });
      try {
        await _apiService.deleteAccount();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Account deleted successfully!')),
        );
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const WelcomeScreen()),
          (Route<dynamic> route) => false,
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Failed to delete account: ${e.toString().replaceFirst('Exception: ', '')}',
            ),
          ),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Profile', style: AppStyle.heading2.copyWith(fontSize: 24)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              _isEditingProfile ? Icons.cancel : Icons.edit,
              color: AppColor.primaryBlack,
            ),
            onPressed: () {
              setState(() {
                _isEditingProfile = !_isEditingProfile;
                if (!_isEditingProfile && _currentUser != null) {
                  _nameController.text = _currentUser!.name;
                  _emailController.text = _currentUser!.email;
                }
                _profileErrors = {
                  'name': null,
                  'email': null,
                }; // Clear profile errors
              });
            },
          ),
        ],
      ),
      body: SafeArea(
        child:
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _currentUser == null
                ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Could not load profile data.'),
                      const SizedBox(height: 16),
                      CustomButton(
                        text: 'Retry',
                        onPressed: _fetchProfile,
                        backgroundColor: AppColor.primaryBlack,
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                )
                : SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Your Information', style: AppStyle.heading2),
                      const SizedBox(height: 24),
                      if (!_isEditingProfile) ...[
                        _buildProfileInfoRow(
                          label: 'Name',
                          value: _currentUser!.name,
                        ),
                        _buildProfileInfoRow(
                          label: 'Email',
                          value: _currentUser!.email,
                        ),
                        const SizedBox(height: 48),
                      ] else ...[
                        Text('Name', style: AppStyle.inputLabel),
                        const SizedBox(height: 8.0),
                        TextField(
                          controller: _nameController,
                          onChanged: (_) => _clearProfileFieldError('name'),
                          decoration: InputDecoration(
                            hintText: 'Your Name',
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
                            errorText: _profileErrors['name'],
                            errorMaxLines: 2,
                          ),
                          keyboardType: TextInputType.name,
                        ),
                        const SizedBox(height: 24.0),
                        Text('Email', style: AppStyle.inputLabel),
                        const SizedBox(height: 8.0),
                        TextField(
                          controller: _emailController,
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: 'Email cannot be changed',
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
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 48.0),
                        CustomButton(
                          text: 'Save Changes',
                          onPressed: _updateProfile,
                          backgroundColor: AppColor.primaryBlack,
                          textColor: Colors.white,
                        ),
                        const SizedBox(height: 24.0),
                      ],
                      const SizedBox(height: 24),
                      CustomButton(
                        text: 'Logout',
                        onPressed: _logout,
                        backgroundColor: AppColor.lightGrey,
                        textColor: AppColor.primaryBlack,
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        text: 'Delete Account',
                        onPressed: _deleteAccount,
                        backgroundColor: Colors.red.shade100,
                        textColor: Colors.red,
                      ),
                    ],
                  ),
                ),
      ),
    );
  }

  Widget _buildProfileInfoRow({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppStyle.inputLabel.copyWith(color: AppColor.iconGrey),
          ),
          const SizedBox(height: 4),
          Text(value, style: AppStyle.bodyText.copyWith(fontSize: 16)),
          const Divider(color: AppColor.lightGrey, thickness: 1),
        ],
      ),
    );
  }
}