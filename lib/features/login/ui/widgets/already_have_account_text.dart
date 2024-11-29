import 'package:flutter/widgets.dart';
import 'package:omar_ahmad_advanced_concept/core/theme/styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
            text: "Already Have an Account ?",
            style: TextStyles.font13DarkBlueRegular),
        TextSpan(text: " Sign Up", style: TextStyles.font13BlueSemiBold)
      ]),
    );
  }
}
