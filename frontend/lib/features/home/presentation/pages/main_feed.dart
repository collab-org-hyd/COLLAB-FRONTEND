import 'package:flutter/material.dart';
import 'package:frontend/core/constants/common_style.dart';
import 'package:frontend/features/home/presentation/pages/header.dart';
import 'package:frontend/features/home/presentation/pages/footer.dart';

class MainFeed extends StatelessWidget {
  const MainFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: SafeArea(
        child: Column(
          children: [
            const Header(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),

                    /// Page Title
                    Text('Main Feed', style: AppTextStyles.heading),

                    const Spacer(),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
