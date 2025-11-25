import 'package:flutter/material.dart';

class MyIdentityWidget extends StatelessWidget {
  const MyIdentityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
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
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/icons/profile.png',
                    width: 40,
                    height: 40,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(width: 16),

              Text(
                'My Identity',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Image background
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  'assets/images/profile_pic.png', // Replace with your image path
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 320.0, // Adjust height as necessary
                ),
              ),
              // Overlay with gradient
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.2),
                      Colors.black.withOpacity(0.4),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12),
                      Text(
                        textAlign: TextAlign.center,

                        "“I am driven to succeed \nand realize my goals.”",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 12.0,
            runSpacing: 12,
            children: [
              _buildTag(
                "Lifelong Learner",
                Icons.wb_sunny,
                context,
                Colors.yellow,
              ),
              _buildTag("Caring Friend", Icons.favorite, context, Colors.red),
              _buildTag(
                "Visionary Creator",
                Icons.visibility,
                context,
                Colors.blue,
              ),
              _buildTag(
                "Consistent Achiever",
                Icons.turn_sharp_right,
                context,
                Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTag(
    String label,
    IconData icon,
    BuildContext context,
    Color iconColor,
  ) {
    return Container(
      width: (MediaQuery.of(context).size.width / 2) - 40,
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 18), // Dynamic icon color
          SizedBox(width: 8),
          Text(label, style: TextStyle(fontSize: 12, color: Colors.white)),
        ],
      ),
    );
  }
}
