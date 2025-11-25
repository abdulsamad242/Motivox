import 'package:flutter/material.dart';
import 'package:motivix/theme/app_gradients.dart';

class PositioningSection extends StatelessWidget {
  final String description;
  final String imagePath;
  final bool isImageOnRight;

  const PositioningSection({
    super.key,
    required this.description,
    required this.imagePath,
    this.isImageOnRight = false, // Default value is false (image on the left)
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 24.0),
      decoration: BoxDecoration(
        gradient: AppGradients.mainBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: isImageOnRight
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!isImageOnRight)
            Image.asset(
              imagePath,
              width: 70.0,
              height: 70.0,
              fit: BoxFit.cover,
            ),
          SizedBox(width: 12),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(30),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
          if (isImageOnRight) SizedBox(width: 12),
          if (isImageOnRight)
            Image.asset(
              imagePath,
              width: 70.0,
              height: 70.0,
              fit: BoxFit.cover,
            ),
        ],
      ),
    );
  }
}
