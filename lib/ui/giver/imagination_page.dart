import 'package:flutter/material.dart';
import 'package:motivix/theme/app_gradients.dart';
import 'package:motivix/widgets/app_header.dart';
import 'package:motivix/widgets/dream_upload.dart';
import 'package:motivix/widgets/idenity.dart';
import 'package:motivix/widgets/vision_grid.dart';

class VisonBoardScreen extends StatefulWidget {
  const VisonBoardScreen({super.key});

  @override
  State<VisonBoardScreen> createState() => _VisonBoardScreenState();
}

class _VisonBoardScreenState extends State<VisonBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(gradient: AppGradients.mainBackground),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              AppHeader(),
              SizedBox(height: 20),
              _buildVisionBoardSection(),
              SizedBox(height: 20),
              MyIdentityWidget(),
              SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  'assets/images/vision.jpg',
                  width: double.infinity,
                  height: 300,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "My Dream life",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "What you dream defines what build.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              SizedBox(height: 20),
              VisionBoardGrid(
                visionItems: [
                  {
                    'image': 'assets/images/startup_image.png',
                    'title': 'Build a startup that helps people grow',
                  },
                  {
                    'image': 'assets/images/bmw_image.png',
                    'title': 'I want to own a BMW car',
                  },
                  {
                    'image': 'assets/images/dream_house.png',
                    'title': 'Buy my dream house',
                  },
                  {
                    'image': 'assets/images/travel_world.png',
                    'title': 'Travel the world',
                  },
                ],
              ),
              SizedBox(height: 20),
              DreamUploadWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVisionBoardSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.lightbulb_outline, color: Colors.white, size: 20),
              SizedBox(width: 8),
              Text(
                "My Vision Board",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            "A Picture of who I am Becoming: Confident, Powerful, and Unstoppable.",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}
