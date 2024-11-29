import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omar_ahmad_advanced_concept/core/helpers/app_regex.dart';
import 'package:omar_ahmad_advanced_concept/features/login/logic/cubit/login_cubit.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import 'password_validation.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacter = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordListner();
  }

  void setupPasswordListner() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacter =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<LoginCubit>().formKey,
        child: Column(
          children: [
            AppTextFormField(
              controller: context.read<LoginCubit>().emailController,
              hintText: "Email",
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isEmailValid(value)) {
                  return "Please Enter a Valid Email.";
                }
              },
            ),
            verticalSpace(18),
            AppTextFormField(
              controller: context.read<LoginCubit>().passwordController,
              hintText: "Password",
              isObscureText: !isObscureText,
              suffixIcon: AnimatedCrossFade(
                firstChild: IconButton(
                    color: ColorsManager.mainBlue,
                    onPressed: () => setState(() => isObscureText = false),
                    icon: const Icon(
                      Icons.visibility,
                      size: 20,
                    )),
                secondChild: IconButton(
                    color: ColorsManager.mainBlue,
                    onPressed: () => setState(() => isObscureText = true),
                    icon: const Icon(
                      Icons.visibility_off,
                      size: 20,
                    )),
                crossFadeState: isObscureText
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(seconds: 1),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter a Valid Email.";
                }
              },
            ),
            verticalSpace(24),
            PasswordValidation(
              hasLowerCase: hasLowerCase,
              hasMinLength: hasMinLength,
              hasNumber: hasNumber,
              hasSpecialCharacter: hasSpecialCharacter,
              hasUpperCase: hasUpperCase,
            ),
          ],
        ));
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
