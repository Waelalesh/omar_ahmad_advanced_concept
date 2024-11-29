import 'package:flutter/material.dart';
import 'package:omar_ahmad_advanced_concept/core/helpers/spacing.dart';
import 'package:omar_ahmad_advanced_concept/core/theme/colors.dart';
import 'package:omar_ahmad_advanced_concept/core/theme/styles.dart';

class PasswordValidation extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacter;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidation(
      {super.key,
      required this.hasLowerCase,
      required this.hasUpperCase,
      required this.hasSpecialCharacter,
      required this.hasNumber,
      required this.hasMinLength});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow("At least 1 lowerCase letter", hasLowerCase),
        verticalSpace(2),
        buildValidationRow("At least 1 upperCase letter", hasUpperCase),
        verticalSpace(2),
        buildValidationRow("At least 1 special character", hasSpecialCharacter),
        verticalSpace(2),
        buildValidationRow("At least 1 number", hasNumber),
        verticalSpace(2),
        buildValidationRow("At least 8 character Long", hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsManager.gray,
        ),
        horizontalSpace(6),
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular.copyWith(
              decoration: hasValidated ? TextDecoration.lineThrough : null,
              decorationColor: Colors.green,
              decorationThickness: 2,
              color:
                  hasValidated ? ColorsManager.gray : ColorsManager.darkBlue),
        )
      ],
    );
  }
}
