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
              'Hi, Wael!', 
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

//eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzM2NjgxMjIyLCJleHAiOjE3MzY3Njc2MjIsIm5iZiI6MTczNjY4MTIyMiwianRpIjoiWjBjVVR3WFh1YXA4Z1RtciIsInN1YiI6IjI4MTQiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.JwbDidpi5tNiuwX8NGyqAABbyT2OPibneCLG0kqK4gY
