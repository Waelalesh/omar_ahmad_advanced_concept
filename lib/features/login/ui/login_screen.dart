import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omar_ahmad_advanced_concept/core/helpers/spacing.dart';
import 'package:omar_ahmad_advanced_concept/core/theme/styles.dart';
import 'package:omar_ahmad_advanced_concept/core/widgets/app_button.dart';
import 'package:omar_ahmad_advanced_concept/features/login/logic/cubit/login_cubit.dart';
import 'package:omar_ahmad_advanced_concept/features/login/ui/widgets/dont_have_account_text.dart';
import 'package:omar_ahmad_advanced_concept/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'widgets/email_and_password.dart';
import 'widgets/login_bloc_listner.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                Column(
                  children: [
                    const EmailAndPassword(),
                    verticalSpace(24),
                    Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text("Forgot Password?",
                            style: TextStyles.font13BlueRegular)),
                    verticalSpace(40),
                    AppButton(
                        onPressed: () {
                          validateThenDoLogin(context);
                        },
                        text: "LogIn"),
                    verticalSpace(16),
                    const TermsAndConditionsText(),
                    verticalSpace(60),
                    const DontHaveAccountText(),
                    const LoginBlocListner()
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
