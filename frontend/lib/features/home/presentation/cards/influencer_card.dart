import 'package:flutter/material.dart';
import 'package:frontend/core/constants/common_style.dart';
import 'package:frontend/features/home/presentation/cards/influencer_tag_card.dart';

class InfluencerCard extends StatelessWidget {
  final String name;
  final String category;
  final String? profileImageUrl;
  final String? followerCount;
  final VoidCallback? onTap;

  const InfluencerCard({
    super.key,
    required this.name,
    required this.category,
    this.profileImageUrl,
    this.followerCount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 200,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFF90D5FF),
          border: Border.all(
            color: Color(0xFF0000FF),
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Profile Image
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.inputFill,
              ),
              child: profileImageUrl != null
                  ? ClipOval(
                      child: Image.network(
                        profileImageUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => _placeholderIcon(),
                      ),
                    )
                  : _placeholderIcon(),
            ),
            const SizedBox(width: 16),
            // Name, Category, Followers
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: AppTextStyles.body.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  if (followerCount != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      '$followerCount followers',
                      style: AppTextStyles.body.copyWith(
                        color: Colors.grey[500],
                        fontSize: 12,
                      ),
                    ),
                  ],
                  const SizedBox(height: 43),
                  Container(
                    height: 75,
                    width: 300,
                    child: SingleChildScrollView(
                      // 👈 allows vertical scroll if needed
                      child: Wrap(
                        spacing: 12, // horizontal space
                        runSpacing: 12, // vertical space
                        children: List.generate(15, (index) {
                          return InfluencerTagCard(
                            tag: '#tagtag ${index + 1}',
                          );
                        }),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // Arrow Icon
            Icon(
              Icons.chevron_right,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }

  Widget _placeholderIcon() {
    return Icon(
      Icons.person,
      color: Colors.grey[400],
      size: 30,
    );
  }
}
