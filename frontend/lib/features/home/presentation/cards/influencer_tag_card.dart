import 'package:flutter/material.dart';
import 'package:frontend/core/constants/common_style.dart';

class InfluencerTagCard extends StatelessWidget {
  final String tag;

  const InfluencerTagCard({
    super.key,
    required this.tag,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.blueAccent, // background color
        borderRadius: BorderRadius.circular(5), // rounded corners
      ),
      child: Text(
        tag,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
