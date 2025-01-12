import 'package:flutter/material.dart';
import 'package:omar_ahmad_advanced_concept/core/assets_gen/assets.gen.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Omar!',
              style: TextStyles.font18DarkBlueBold,
            ),
            Text(
              'How Are you Today?',
              style: TextStyles.font12GrayRegular,
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
            radius: 24.0,
            backgroundColor: ColorsManager.moreLighterGray,
            child: Assets.svgs.notifications.svg())
      ],
    );
  }
}
