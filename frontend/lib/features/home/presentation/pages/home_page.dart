import 'package:flutter/material.dart';
import 'package:frontend/core/constants/common_style.dart';

class HomePage extends StatelessWidget {
  final Map<String, dynamic> responseData;

  const HomePage({super.key, required this.responseData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              /// App Logo
              Image.asset(
                AppAssets.logoBlackOnWhite,
                height: 100,
                width: 100,
              ),

              const SizedBox(height: 16),

              /// App Name
              Text(AppStrings.appName, style: AppTextStyles.appName),

              const SizedBox(height: 4),

              Text(AppStrings.appTagline, style: AppTextStyles.tagline),

              const SizedBox(height: 40),

              /// Page Title
              Text('Login Successful!', style: AppTextStyles.heading),

              const SizedBox(height: 30),

              /// Response Details Container
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.inputFill,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Response Details:',
                      style: AppTextStyles.body.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...responseData.entries.map((entry) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${entry.key}: ',
                              style: AppTextStyles.body.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                entry.value.toString(),
                                style: AppTextStyles.body,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),

              const Spacer(),

              /// Logout Button
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
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: Text('Logout', style: AppTextStyles.button),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
