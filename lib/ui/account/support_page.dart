import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motivix/theme/app_colors.dart';

import '../../widgets/app_header.dart';
import '../../widgets/app_background.dart';
import '../../widgets/inputs/large_text_area.dart';
import '../../theme/app_typography.dart';

class SupportHelpPage extends StatefulWidget {
  const SupportHelpPage({super.key});

  @override
  State<SupportHelpPage> createState() => _SupportHelpPageState();
}

class _SupportHelpPageState extends State<SupportHelpPage> {
  int selectedIndex = -1;

  final categories = [
    "Feature Guidance",
    "App Issue",
    "Enhancement Required",
    "Business Guidance",
    "Something Else",
  ];

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0),
            children: [
              SizedBox(height: 10.h),

              /// APP HEADER
              const AppHeader(),
              SizedBox(height: 10.h),

              /// TITLE ROW
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.13),
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(8.w),
                    child: Image.asset(
                      "assets/icons/help.png",
                      width: 25.w,
                      height: 25.h,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 9.w),

                  /// Support / Help (500 – 18px)
                  Text(
                    "Support / Help",
                    style: AppTypography.title.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      letterSpacing: -0.3,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              /// Illustration
              Center(
                child: Image.asset(
                  "assets/images/support_illustration.png",
                  height: 150.h,
                ),
              ),

              SizedBox(height: 20.h),

              /// HOW CAN WE HELP YOU (400 – 22px)
              Center(
                child: Text(
                  "How Can We Help You?",
                  style: AppTypography.title.copyWith(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    letterSpacing: -0.5,
                  ),
                ),
              ),

              SizedBox(height: 22.h),

              /// ALL CATEGORY OPTIONS
              Column(
                children: List.generate(categories.length, (i) {
                  final isSelected = selectedIndex == i;

                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: GestureDetector(
                      onTap: () => setState(() => selectedIndex = i),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 140),
                        padding: EdgeInsets.symmetric(
                            vertical: 13.h, horizontal: 18.w),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.09),
                          borderRadius: BorderRadius.circular(25.r),
                          
                        ),
                        child: Row(
                          children: [
                            /// Radio Circle
                            Container(
                              width: 22.w,
                              height: 22.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.white,
                                  width: 1.3,
                                ),
                                color: isSelected
                                    ? Colors.white.withOpacity(0.15)
                                    : Colors.transparent,
                              ),
                              child: isSelected
                                  ? Center(
                                      child: Container(
                                        width: 12.w,
                                        height: 12.h,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    )
                                  : null,
                            ),

                            SizedBox(width: 15.w),

                            /// TEXT (500 – 16px)
                            Expanded(
                              child: Text(
                                categories[i],
                                style: AppTypography.sectionTitle.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),

              SizedBox(height: 10.h),

              /// TEXT AREA
              LargeTextArea(
                hint: "Please describe your issue or question",
                controller: controller,
                minLines: 4,
              ),

              SizedBox(height: 18.h),

              /// SUBMIT BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11.r),
                    ),
                  ),
                  child: Text(
                    "Submit",
                    style: AppTypography.title.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 25.h),
            ],
          ),
        ),
      
    );
  }
}
