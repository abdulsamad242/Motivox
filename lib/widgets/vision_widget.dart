import 'package:flutter/material.dart';

class VisionSection extends StatelessWidget {
  final String vision;

  const VisionSection({super.key, required this.vision});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Icon(Icons.visibility, color: Colors.white),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              vision,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}