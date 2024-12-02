import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:omar_ahmad_advanced_concept/core/helpers/extensions.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';

import '../../logic/cubit/sign_up_cubit.dart';
import '../../logic/cubit/sign_up_state.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is SignupLoading ||
          current is SignupSuccess ||
          current is SignupError,
      listener: (context, state) {
        state.whenOrNull(
          signupLoading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainBlue,
                ),
              ),
            );
          },
          signupSuccess: (signupResponse) {
            context.pop();
            showSuccessDialog(context);
          },
          signupError: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Signup Successful',
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                AnimatedTextKit(
                  totalRepeatCount: 2,
                  animatedTexts: [
                    TyperAnimatedText(
                        "Welcome To The Engineer\nأَهلاََ بِكَ حَضْرَةَ المُهَندِس",
                        textStyle: TextStyles.font24BlueBold,
                        speed: const Duration(milliseconds: 60),
                        textAlign: TextAlign.center),
                  ],
                ),
                // Text('Congratulations, you have signed up successfully!'),
                // Text(
                //   "Welcome To Engineer\nأهلاََ بالمهندس",
                //   style: TextStyles.font24BlueBold,
                // )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                overlayColor: Colors.white,
                backgroundColor: Colors.blue,
                surfaceTintColor: Colors.grey,
              ),
              onPressed: () {
                context.pushNamed(Routes.homeScreen);
              },
              child:   Text(
                'Continue',
                style: TextStyles.font16WhiteMedium,
              ),
            ),
          ],
        );
      },
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font14BlueSemiBold,
            ),
          ),
        ],
      ),
    );
  }
}
