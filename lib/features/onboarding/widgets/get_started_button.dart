import 'package:flutter/material.dart';
import 'package:omar_ahmad_advanced_concept/core/helpers/extensions.dart';
import 'package:omar_ahmad_advanced_concept/core/routing/routes.dart';
import 'package:omar_ahmad_advanced_concept/core/theme/colors.dart';
import 'package:omar_ahmad_advanced_concept/core/theme/styles.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: ColorsManager.mainBlue,
      minWidth: double.infinity,
      height: 52,
      onPressed: () {
        context.pushNamed(Routes.logInScreen);
      },
      child: Text(
        "Get Started",
        style: TextStyles.font16WhiteSemiBold,
      ),
    );
  }
}
