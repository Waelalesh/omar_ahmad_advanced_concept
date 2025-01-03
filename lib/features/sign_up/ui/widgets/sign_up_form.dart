import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../login/ui/widgets/password_validation.dart';
import '../../logic/cubit/sign_up_cubit.dart';
import 'gender_drop_down.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isPasswordObscureText = false;
  bool isPasswordConfirmationObscureText = false;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignupCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
            },
            controller: context.read<SignupCubit>().nameController,
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: 'Phone number',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number';
              }
            },
            controller: context.read<SignupCubit>().phoneController,
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            controller: context.read<SignupCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: context.read<SignupCubit>().passwordController,
            hintText: 'Password',
            isObscureText: !isPasswordObscureText,
            suffixIcon: AnimatedCrossFade(
              firstChild: IconButton(
                  color: ColorsManager.mainBlue,
                  onPressed: () =>
                      setState(() => isPasswordObscureText = false),
                  icon: const Icon(
                    Icons.visibility,
                    size: 20,
                  )),
              secondChild: IconButton(
                  color: ColorsManager.mainBlue,
                  onPressed: () => setState(() => isPasswordObscureText = true),
                  icon: const Icon(
                    Icons.visibility_off,
                    size: 20,
                  )),
              crossFadeState: isPasswordObscureText
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(seconds: 1),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),
          verticalSpace(18),
          AppTextFormField(
            controller:
                context.read<SignupCubit>().passwordConfirmationController,
            hintText: 'Password Confirmation',
            isObscureText: !isPasswordConfirmationObscureText,
            suffixIcon: AnimatedCrossFade(
              firstChild: IconButton(
                  color: ColorsManager.mainBlue,
                  onPressed: () =>
                      setState(() => isPasswordConfirmationObscureText = false),
                  icon: const Icon(
                    Icons.visibility,
                    size: 20,
                  )),
              secondChild: IconButton(
                  color: ColorsManager.mainBlue,
                  onPressed: () =>
                      setState(() => isPasswordConfirmationObscureText = true),
                  icon: const Icon(
                    Icons.visibility_off,
                    size: 20,
                  )),
              crossFadeState: isPasswordConfirmationObscureText
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(seconds: 1),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),
          verticalSpace(24),
          const GenderDropDown(),
          verticalSpace(18),
          PasswordValidation(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialCharacter: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
