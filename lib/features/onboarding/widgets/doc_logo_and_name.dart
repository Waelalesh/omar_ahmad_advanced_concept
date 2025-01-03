import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omar_ahmad_advanced_concept/core/assets_gen/assets.gen.dart';
import 'package:omar_ahmad_advanced_concept/core/theme/styles.dart';

class DocLogoAndName extends StatelessWidget {
  const DocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.svgs.docLogo.svg(),
        SizedBox(
          width: 10.w,
        ),
        Text(
          "Docdoc",
          style: TextStyles.font24BlackBold,
        )
      ],
    );
  }
}
