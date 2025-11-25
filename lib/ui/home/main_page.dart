import 'package:flutter/material.dart';
import 'package:motivix/theme/app_gradients.dart';
import 'package:motivix/widgets/emojie_widget.dart';
import 'package:motivix/widgets/greeting_card.dart';
import 'package:motivix/widgets/growth_section.dart';
import 'package:motivix/widgets/info_section.dart';
import 'package:motivix/widgets/my_daily_diary.dart';
import 'package:motivix/widgets/producitivity.dart';
import 'package:motivix/widgets/progress_cricle.dart';
import 'package:motivix/widgets/quote.dart';
import 'package:motivix/widgets/vision_board.dart';
import 'package:motivix/widgets/your_daily_giver.dart';

class MyMotivationalApp extends StatelessWidget {
  const MyMotivationalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppGradients.mainBackground),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(35),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Header(),
                        SizedBox(height: 20),
                        GreetingCard(),
                        SizedBox(height: 20),
                        QuoteSection(
                          quote:
                              "The only way to achieve the impossible is to believe it is possible",
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Text(
                      "My Positioning",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                PositioningSection(
                  description:
                      'I lead with empathy, strength, and authenticity. "As confident, kind, and committed to making a difference."',
                  imagePath: 'assets/images/compass_icon.png',
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "My Vision for the World",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Share the change you want to see around you",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white60,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                PositioningSection(
                  description: '“A world where people live with their dreams.”',
                  imagePath: 'assets/images/eye.png',
                ),
                Row(
                  children: [
                    Text(
                      "What Drives Me",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Share the actions you’re taking to make your vision real",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white60,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                PositioningSection(
                  isImageOnRight: true,
                  description:
                      '“I am on a mission to help 1 million people build a second source of income from their skills and experience, so they can achieve true freedom and fulfillment.”',
                  imagePath: 'assets/images/plane.png',
                ),

                SizedBox(height: 24),
                DailyGiverWidget(progress: 40),
                SizedBox(height: 24),
                GrowthActionsWidget(),
                SizedBox(height: 24),
                DailyActivityWidget(progress: 80),
                SizedBox(height: 24),
                VisionBoardWidget(),
                SizedBox(height: 24),
                FeelingWidget(),
                SizedBox(height: 24),
                DailyDiaryWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
