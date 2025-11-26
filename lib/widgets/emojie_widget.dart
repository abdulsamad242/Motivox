import 'package:flutter/material.dart';
import 'package:motivix/theme/app_colors.dart';
import 'package:motivix/theme/app_gradients.dart';

class FeelingWidget extends StatelessWidget {
  const FeelingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    double titleSize = width * 0.03; // Responsive title
    double emojiSize = width * 0.06; // Emoji scale
    double cardPadding = width * 0.04;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.all(cardPadding),
          decoration: BoxDecoration(
            gradient: AppGradients.dailygiver,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TITLE
              Text(
                "How are you feeling now?",
                style: TextStyle(
                  fontSize: titleSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: height * 0.02),

              // SEARCH BOX
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.15),
                  hintText: 'Search emotion...',
                  hintStyle: TextStyle(
                    color: Colors.white70,
                    fontSize: width * 0.04,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: width * 0.06,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),

              // EMOJI GRID
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: width < 350
                      ? 3
                      : 4, // Auto adjust for small screens
                  crossAxisSpacing: width * 0.02,
                  mainAxisSpacing: height * 0.02,
                  childAspectRatio: width < 350 ? 0.75 : 0.85,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  final emojis = [
                    '😊',
                    '😐',
                    '😭',
                    '😣',
                    '😍',
                    '😎',
                    '😴',
                    '😡',
                    '🥰',
                    '🔥',
                    '😞',
                    '🤔',
                  ];
                  final titles = [
                    'Happy',
                    'Neutral',
                    'Sad',
                    'Anxious',
                    'Loved',
                    'Confident',
                    'Tired',
                    'Angry',
                    'Grateful',
                    'Excited',
                    'Lonely',
                    'Confused',
                  ];
                  final counts = [20, 2, 0, 0, 2, 2, 0, 0, 2, 2, 0, 0];

                  return Container(
                    padding: EdgeInsets.all(width * 0.02),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(emojis[index], style: TextStyle(fontSize: 18)),
                        SizedBox(height: height * 0.005),
                        Text(
                          "${counts[index]}",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        Text(
                          titles[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  );
                },
              ),

              SizedBox(height: height * 0.02),

              // SEE LESS Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonBackground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: height * 0.018),
                  ),
                  child: Text(
                    "See Less",
                    style: TextStyle(
                      fontSize: width * 0.045,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: height * 0.02),

              // QUOTE BOX
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.02,
                  horizontal: width * 0.03,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "\"Keep shining, your positivity is contagious!\"",
                  style: TextStyle(
                    fontSize: width * 0.04,
                    color: Colors.white.withOpacity(0.85),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
