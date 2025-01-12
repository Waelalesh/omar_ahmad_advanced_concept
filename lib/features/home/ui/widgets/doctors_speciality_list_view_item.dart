import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:omar_ahmad_advanced_concept/features/home/data/models/specializations_response_model.dart';

import '../../../../core/assets_gen/assets.gen.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';

class DoctorsSpecialityListViewItem extends StatelessWidget {
  final SpecializationsData data;
  final int index;
  const DoctorsSpecialityListViewItem(
      {super.key, required this.data, required this.index,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: ColorsManager.lightBlue,
            child: SvgPicture.asset(
              Assets.svgs.generalSpeciality.path,
              height: 40.h,
              width: 40.w,
            ),
          ),
          verticalSpace(8),
          Text(
            data.name ?? "Specialization",
            style: TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
