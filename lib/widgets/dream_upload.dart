import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class DreamUploadWidget extends StatelessWidget {
  const DreamUploadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dotted Border for Upload Image Section
          DottedBorder(
            options:
                const RectDottedBorderOptions(), // Use correct DottedBorderOptions

            child: Row(
              children: [
                Icon(Icons.camera_alt, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'Upload a Dream Image',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          // Upload Button
          ElevatedButton(
            onPressed: () {
              // Handle image upload action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white.withOpacity(0.4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            ),
            child: Text('Select Image', style: TextStyle(color: Colors.white)),
          ),
          SizedBox(height: 24),
          // Description Section
          Text(
            'Write few lines about his/her dream.',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          SizedBox(height: 8),
          // Text Field for Description
          TextField(
            maxLines: 5,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              hintText: 'Describe the dream...',
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 24),
          // Save Button
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Handle save action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 40),
              ),
              child: Text('Save', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
