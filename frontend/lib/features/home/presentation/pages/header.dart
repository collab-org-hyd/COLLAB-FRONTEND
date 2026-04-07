import 'package:flutter/material.dart';
import 'package:frontend/core/constants/common_style.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// App Logo
          // Image.asset(
          //   AppAssets.logoBlackOnWhite,
          //   height: 60,
          //   width: 60,
          // ),

          /// App Name
          Text(AppStrings.appName,
              style: AppTextStyles.appName.copyWith(
                fontSize: 26,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
