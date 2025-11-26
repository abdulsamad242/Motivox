import 'package:flutter/material.dart';
import 'package:motivix/theme/app_colors.dart';
import 'package:motivix/theme/app_gradients.dart';

class VisionBoardWidget extends StatelessWidget {
  const VisionBoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: AppGradients.dailygiver,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My Vision Board",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildVisionSection(
                context: context,
                title: "My Identity",
                imagePath: "assets/images/profile.png",
                items: [
                  "I am a Great Character",
                  "I am a Great Leader",
                  "I am a Great Author",
                  "I am a Great Speaker",
                  "I am a Great Entrepreneur",
                ],
              ),
              _buildVisionSection(
                context: context,
                title: "My Dream Life",
                imagePath: "assets/images/star.png",
                items: [
                  "I want to earn 1 Cr this year",
                  "I want to be physically fit",
                  "I want to visit the world",
                  "I want to make my relationships ",
                  "I want to have my own business",
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary, // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 14.0),
              ),
              child: Text(
                "Explore My Vision Board",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVisionSection({
    required String title,
    required String imagePath,
    required List<String> items,
    required BuildContext context,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.42,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
              SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          ...items.map((item) {
            return Row(
              children: [
                Icon(Icons.check, color: Colors.white, size: 10),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    item,
                    style: TextStyle(fontSize: 12, color: Colors.white),
                    overflow: TextOverflow
                        .ellipsis, // This will add the ellipsis when text overflows
                    maxLines: 1, // Ensures text is truncated after one line
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
