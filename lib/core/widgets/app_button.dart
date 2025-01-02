import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/colors.dart';
import '../theme/styles.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      this.borderRadius,
      this.backgorundColor,
      this.width,
      this.hieght,
      required this.onPressed,
      required this.text,
      this.textstyle,
      this.verticalPadding,
      this.horizontalPadding});
  final double? borderRadius;
  final Color? backgorundColor;
  final double? width;
  final double? hieght;
  final void Function() onPressed;
  final String text;
  final TextStyle? textstyle;
  final double? verticalPadding;
  final double? horizontalPadding;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 12.w,
          vertical: verticalPadding ?? 14.h),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 16)),
      color: backgorundColor ?? ColorsManager.mainBlue,
      minWidth: width ?? double.infinity,
      height: hieght ?? 52,
      onPressed: onPressed,
      child: Text(
        text,
        style: textstyle ?? TextStyles.font16WhiteSemiBold,
      ),
    );
  }
}
