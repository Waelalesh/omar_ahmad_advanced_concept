import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/assets_gen/assets.gen.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/styles.dart';

class DoctorsBlueContainer extends StatelessWidget {
  const DoctorsBlueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h, 
      child: Stack( 
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: 185.h,
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              image: DecorationImage(
                image: Assets.images.homeBluePattern.image().image,
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Book and\nschedule with\nnearest doctor',
                  style: TextStyles.font18WhiteMedium,
                  textAlign: TextAlign.start,
                ),
                verticalSpace(16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(48.0),
                      ),
                    ),
                    child: Text(
                      'Find Nearby',
                      style: TextStyles.font12BlueRegular,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 8.w,
            top: -10.h,
            bottom: 5.h,
            child: Image.asset(
              Assets.images.homeDoctor.path,
              height: 200.h, 
            ),
          ),
        ],
      ),
    );
  }
}
