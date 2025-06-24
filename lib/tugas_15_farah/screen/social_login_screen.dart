import 'package:flutter/material.dart';
import 'package:belajar_flutter2/constant/app_color.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton(
          icon: Image.asset(
            'assets/icons/google.png',
            height: 24,
          ), // Add your Google icon
          onPressed: () {
            print('Google login');
          },
        ),
        // const SizedBox(width: 16.0),
        // _buildSocialButton(
        //   icon: Image.asset(
        //     'assets/icons/linkedin.png',
        //     height: 24,
        //   ), // Add your LinkedIn icon
        //   onPressed: () {
        //     print('LinkedIn login');
        //   },
        // ),
        const SizedBox(width: 16.0),
        _buildSocialButton(
          icon: Image.asset(
            'assets/icons/facebook.png',
            height: 24,
          ), // Add your Facebook icon
          onPressed: () {
            print('Facebook login');
          },
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required Widget icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 56, // Fixed width for square button
      height: 56, // Fixed height for square button
      decoration: BoxDecoration(
        color: AppColor.lightGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(icon: icon, onPressed: onPressed),
    );
  }
}