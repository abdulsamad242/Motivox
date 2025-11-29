import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/app_header.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/app_background.dart';
import '../../theme/app_typography.dart';

class WhySummaryPage extends StatelessWidget {
  const WhySummaryPage({super.key});

  // ---------------------------------------------------------------------------
  // GLASS CARD BUILDER (same style as onboarding screens)
  // ---------------------------------------------------------------------------

  Widget _buildInfoCard({
    required String iconPath,
    required String title,
    required String value,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 18.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.18),
        borderRadius: BorderRadius.circular(10.r),
        
       
        
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //--------------------------------------------------------------------
          // ICON + TITLE
          //--------------------------------------------------------------------
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 40.w,
                width: 40.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.15),
                ),
                child: Center(
                  child: Image.asset(
                    iconPath,
                    width: 18.w,
                    height: 18.h,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  title,
                  style: AppTypography.sectionTitle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400, // ← required
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          //--------------------------------------------------------------------
          // VALUE TEXT
          //--------------------------------------------------------------------
          Text(
            value,
            style: AppTypography.subtitle.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: 1.45,
              color: Colors.white.withOpacity(0.60),
            ),
          ),
        ],
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //------------------------------------------------------------------
                // HEADER
                //------------------------------------------------------------------
                const AppHeader(),
                SizedBox(height: 26.h),

                //------------------------------------------------------------------
                // MAIN TITLE + SUBTITLE (custom icon: power)
                //------------------------------------------------------------------
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50.w,
                      width: 50.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.12),
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/icons/power.png",
                          width: 30.w,
                          height: 30.h,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "The Power Behind My Why",
                            style: AppTypography.title.copyWith(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w500, // required
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            "A reminder of why I started and where I'm heading.",
                            style: AppTypography.formLabel.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.4,
                              color: Colors.white.withOpacity(0.70),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 28.h),

                //------------------------------------------------------------------
                // CARDS (with correct icons)
                //------------------------------------------------------------------

                _buildInfoCard(
                  iconPath: "assets/icons/niche.png",
                  title: "Your niche",
                  value: "Entrepreneurship",
                ),
                SizedBox(height: 18.h),

                _buildInfoCard(
                  iconPath: "assets/icons/microniche.png",
                  title: "Your micro niche",
                  value: "Providing Item to People",
                ),
                SizedBox(height: 18.h),

                _buildInfoCard(
                  iconPath: "assets/icons/vis.png",
                  title: "Your vision",
                  value:
                      "Helping people to fulfill their dreams to live a happy and fulfilled life.",
                ),
                SizedBox(height: 18.h),

                _buildInfoCard(
                  iconPath: "assets/icons/mis.png",
                  title: "Your mission",
                  value:
                      "Helping 1 million people build a second source of income using their skills and knowledge.",
                ),
                SizedBox(height: 18.h),

                _buildInfoCard(
                  iconPath: "assets/icons/pos.png",
                  title: "Your positioning",
                  value:
                      "A freedom coach supporting people to create financial stability and fulfillment.",
                ),
                SizedBox(height: 18.h),

                _buildInfoCard(
                  iconPath: "assets/icons/brand.png",
                  title: "Your brand",
                  value:
                      "Yet to be decided — take your time and let your identity evolve naturally.",
                ),
                SizedBox(height: 35.h),

                //------------------------------------------------------------------
                // BUTTON
                //------------------------------------------------------------------
                PrimaryButton(
                  label: "View Your Vision Board",
                  onTap: () {
  context.go('/vision');
},
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      
    );
  }
}
