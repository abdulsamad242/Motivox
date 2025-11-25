import 'package:flutter/material.dart';
import 'package:motivix/theme/app_colors.dart';

class DailyActivityWidget extends StatelessWidget {
  final int progress;

  const DailyActivityWidget({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0F1936), Color(0xFFFF9D5C)],
          stops: [0.2, 0.8],
        ),
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
            "Daily Productivity, Actions & Insights",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Track your actions. Measure your progress. Fuel your growth.",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 140,
                  height: 140,
                  child: CircularProgressIndicator(
                    value: progress / 100,
                    strokeWidth: 10,
                    backgroundColor: Colors.grey.withOpacity(0.3),
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "$progress%",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text('Today’s\n Efficiency', textAlign: TextAlign.center),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          SizedBox(height: 20),
          _buildInfoRow(
            icon: Icons.access_time,
            label: "Hours Focused: 4h 20m",
          ),
          SizedBox(height: 12),
          _buildInfoRow(
            icon: Icons.check_circle_outline,
            label: "Tasks Completed: 6/8",
          ),
          SizedBox(height: 12),
          _buildInfoRow(icon: Icons.fireplace, label: "Streak: 5-day active"),
          SizedBox(height: 20),
          Text(
            "Great work! You’re ahead of yesterday – keep the momentum going.",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                // Button orange
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 40),
              ),
              child: Text(
                "View Dashboard",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({required IconData icon, required String label}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white),
          ),
          SizedBox(width: 8),
          Text(label, style: TextStyle(fontSize: 16, color: Colors.white)),
        ],
      ),
    );
  }
}
