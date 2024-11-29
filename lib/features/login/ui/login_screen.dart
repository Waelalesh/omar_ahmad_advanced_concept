import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omar_ahmad_advanced_concept/core/helpers/spacing.dart';
import 'package:omar_ahmad_advanced_concept/core/theme/colors.dart';
import 'package:omar_ahmad_advanced_concept/core/theme/styles.dart';
import 'package:omar_ahmad_advanced_concept/core/widgets/app_button.dart';
import 'package:omar_ahmad_advanced_concept/core/widgets/app_text_form_field.dart';
import 'package:omar_ahmad_advanced_concept/features/login/ui/widgets/already_have_account_text.dart';
import 'package:omar_ahmad_advanced_concept/features/login/ui/widgets/terms_and_conditions_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpace(8),
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const AppTextFormField(hintText: "Email"),
                        verticalSpace(18),
                        AppTextFormField(
                          hintText: "Password",
                          isObscureText: isObscureText,
                          suffixIcon: AnimatedCrossFade(
                              firstChild: IconButton(
                                  color:  ColorsManager.mainBlue,
                                  onPressed: () =>
                                      setState(() => isObscureText = false),
                                  icon: const Icon(Icons.visibility , size: 20 ,)),
                              secondChild: IconButton(
                                  color: ColorsManager.mainBlue,
                                  onPressed: () =>
                                      setState(() => isObscureText = true),
                                  icon: const Icon(Icons.visibility_off ,  size: 20 ,)),
                              crossFadeState: isObscureText
                                  ? CrossFadeState.showFirst
                                  : CrossFadeState.showSecond,
                              duration: const Duration(seconds: 1)),
                        ),
                        verticalSpace(14),
                        Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Text("Forgot Password?",
                                style: TextStyles.font13BlueRegular)),
                        verticalSpace(40),
                        AppButton(onPressed: () {}, text: "LogIn"),
                        verticalSpace(16),
                        const TermsAndConditionsText(),
                        verticalSpace(60),
                        const AlreadyHaveAccountText()
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
