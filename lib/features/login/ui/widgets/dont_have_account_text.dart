import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:omar_ahmad_advanced_concept/core/helpers/extensions.dart';
import 'package:omar_ahmad_advanced_concept/core/routing/routes.dart';
import 'package:omar_ahmad_advanced_concept/core/theme/styles.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
            text: "Don't Have an Account ?",
            style: TextStyles.font13DarkBlueRegular),
        TextSpan(
            text: " Sign Up",
            style: TextStyles.font13BlueSemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () => context.pushNamed(Routes.signUpScreen))
      ]),
    );
  }
}
