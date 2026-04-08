import 'package:flutter/material.dart';
import 'package:frontend/core/constants/common_style.dart';
import 'package:frontend/features/home/presentation/pages/main_feed.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () async {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                    size: 28,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () async {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainFeed(),
                  ),
                );
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.manage_search_rounded,
                    color: Colors.white,
                    size: 28,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
