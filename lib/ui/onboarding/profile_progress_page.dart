import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/app_header.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/app_background.dart';
import '../../theme/app_typography.dart';

class ProfileProgressPage extends StatelessWidget {
  const ProfileProgressPage({super.key});

  // ------- Reusable Progress Card -------
  Widget _progressCard({
    required BuildContext context,
    required bool isComplete,
    required String title,
    required String subtitle,
    required double progress, // now expects 0–1 value
    bool showContinue = false,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.13),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: Colors.white.withOpacity(0.14),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // ICON
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: isComplete
                      ? Colors.green.withOpacity(0.18)
                      : Colors.white.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isComplete ? Icons.check_circle : Icons.flag,
                  color: isComplete ? Colors.greenAccent : Colors.white,
                  size: 18.sp,
                ),
              ),

              SizedBox(width: 12.w),

              // TEXT BLOCK
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Title (500w – 16px)
                    Text(
                      title,
                      style: AppTypography.sectionTitle.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),

                    /// Subtitle (400w – 12px)
                    Text(
                      subtitle,
                      style: AppTypography.formLabel.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.70),
                      ),
                    ),
                  ],
                ),
              ),

              if (!isComplete && showContinue)
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    "Continue",
                    style: AppTypography.formLabel.copyWith(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
            ],
          ),

          SizedBox(height: 14.h),

          /// Progress bar
          Stack(
  children: [
    Container(
      height: 6.h,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(10.r),
      ),
    ),

    Container(
      height: 6.h,
      width: (MediaQuery.of(context).size.width - 32.w) * progress,
      decoration: BoxDecoration(
        color: const Color(0xFFFF8C42),
        borderRadius: BorderRadius.circular(10.r),
      ),
    ),
  ],
),


          SizedBox(height: 6.h),

          /// % label
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "${(progress * 100).round()}%",
              style: AppTypography.formLabel.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.90),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ------- Recommendation Box -------
  Widget _buildRecommendationSection(BuildContext context) {
    return Container(
  width: MediaQuery.of(context).size.width,
  // The incorrect 'height' property is still REMOVED, allowing the height to be determined
  // by its child + its own padding/margin.
  
  margin: EdgeInsets.symmetric(vertical: 8.h),
  decoration: BoxDecoration(
    color: Colors.white.withOpacity(0.16),
    borderRadius: BorderRadius.circular(24.r),
    border: Border.all(
      color: Colors.white.withOpacity(0.10),
      width: 1.2,
    ),
  ),

  // ------------------------------------------------------------------
  // FIX: Adjusting the parent padding to add the extra space at the bottom.
  // We keep 3.r for the border effect everywhere else, but increase the bottom.
  padding: EdgeInsets.fromLTRB(9.r, 10.r, 9.r, 43.r), // (3 + 40)
  // ------------------------------------------------------------------

  child: Container(
    width: double.infinity,
    // The inner container's padding remains the same:
    padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 28.h), 

    decoration: BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          Color(0xFF3C4768),   // deep soft blue
          Color(0xFF4F4E7A),   // muted purple
          Color(0xFFB07A56),   // subtle orange only top-right
        ],
        stops: [0.0, 0.75, 1.0],
      ),
      borderRadius: BorderRadius.circular(22.r),
      border: Border.all(
        color: Colors.white.withOpacity(0.12),
        width: 1,
      ),
    ),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.lightbulb,
                color: Colors.white,
                size: 20.sp,
              ),
            ),

            SizedBox(width: 12.w),

            Expanded(
              child: Text(
                "Based on your completed details, we recommend adding your Vision & Mission next — it helps you stand out 3× more.",
                style: AppTypography.formLabel.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.35,
                  color: Colors.white.withOpacity(0.85),
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 20.h), 

        PrimaryButton(
          label: "Continue...",
          onTap: () {},
        ),
      ],
    ),
  ),
);

  }

  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
            child: Column(
              children: [
                const AppHeader(),
                SizedBox(height: 22.h),

                /// MAIN TITLE (500w – 20px)
                Text(
                  "Your Profile Progress",
                  style: AppTypography.title.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 6.h),

                /// SUBTITLE (400w – 12px)
                Text(
                  "Complete your profile to unlock full visibility and features.",
                  textAlign: TextAlign.center,
                  style: AppTypography.subtitle.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.70),
                  ),
                ),

                SizedBox(height: 28.h),

                /// Circular progress
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 130.w,
                      height: 130.w,
                      child: CircularProgressIndicator(
                        strokeWidth: 10.w,
                        value: 0.6,
                        backgroundColor: Colors.white.withOpacity(0.12),
                        valueColor: const AlwaysStoppedAnimation(
                          Color(0xFFFF8C42),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "60%",
                          style: AppTypography.title.copyWith(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Completed",
                          style: AppTypography.formLabel.copyWith(
                            color: Colors.white.withOpacity(0.75),
                          ),
                        )
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 26.h),

                // ------- PROGRESS CARDS -------
                _progressCard(
                  isComplete: true,
                  title: "Basic Details",
                  subtitle: "Complete",
                  progress: 1.0,
                  context: context,
                ),

                SizedBox(height: 18.h),

                _progressCard(
                  isComplete: true,
                  title: "Niche & Micro Niche",
                  subtitle: "Complete",
                  progress: 1.0,
                  context: context
                ),

                SizedBox(height: 18.h),

                _progressCard(
                  isComplete: false,
                  title: "Vision & Mission",
                  subtitle: "In Progress",
                  showContinue: true,
                  progress: 0.30,
                  context: context
                ),

                SizedBox(height: 18.h),

                _progressCard(
                  isComplete: false,
                  title: "Positioning & Branding",
                  subtitle: "In Progress",
                  showContinue: true,
                  progress: 0.20,
                  context: context
                ),

                SizedBox(height: 20.h),

                _buildRecommendationSection(context),
             
              ],
            ),
          ),
        ),
      
    );
  }
}
