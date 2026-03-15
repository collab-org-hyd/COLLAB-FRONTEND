import 'package:flutter/material.dart';
import 'package:frontend/core/constants/common_style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              /// App Logo
              Image.asset(
                AppAssets.logoBlackOnWhite,
                height: 100,
                width: 100,
              ),

              const SizedBox(height: 16),

              /// App Name — Genty font
              Text(AppStrings.appName, style: AppTextStyles.appName),

              const SizedBox(height: 4),

              Text(AppStrings.appTagline, style: AppTextStyles.tagline),

              const SizedBox(height: 30),

              /// Page Title
              Text(AppStrings.loginTitle, style: AppTextStyles.heading),

              const SizedBox(height: 30),

              /// Email Field
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: AppStrings.emailLabel,
                  labelStyle: AppTextStyles.body,
                  filled: true,
                  fillColor: AppColors.inputFill,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              /// Continue Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    print('Email: ${_emailController.text}');
                  },
                  child:
                      Text(AppStrings.continueBtn, style: AppTextStyles.button),
                ),
              ),

              const SizedBox(height: 30),

              /// Divider
              Row(
                children: [
                  Expanded(child: Divider(color: AppColors.border)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(AppStrings.orContinueWith,
                        style: AppTextStyles.dividerLabel),
                  ),
                  Expanded(child: Divider(color: AppColors.border)),
                ],
              ),

              const SizedBox(height: 20),

              /// Social Buttons
              Row(
                children: [
                  /// Google
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.border),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.g_mobiledata, size: 28),
                          const SizedBox(width: 8),
                          Text(AppStrings.googleLabel,
                              style: AppTextStyles.socialLabel),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  /// Apple
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.border),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.apple),
                          const SizedBox(width: 8),
                          Text(AppStrings.appleLabel,
                              style: AppTextStyles.socialLabel),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
