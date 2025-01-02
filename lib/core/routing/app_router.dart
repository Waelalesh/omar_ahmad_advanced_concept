import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omar_ahmad_advanced_concept/core/di/dependency_injection.dart';
import 'package:omar_ahmad_advanced_concept/core/routing/routes.dart';
import 'package:omar_ahmad_advanced_concept/features/login/logic/cubit/login_cubit.dart';
import 'package:omar_ahmad_advanced_concept/features/login/ui/login_screen.dart';
import 'package:omar_ahmad_advanced_concept/features/onboarding/onboarding_screen.dart';
import 'package:omar_ahmad_advanced_concept/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:omar_ahmad_advanced_concept/features/sign_up/ui/sign_up_screen.dart';

import '../../features/home/ui/home_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
            builder: (context) => const OnboardingScreen());

      case Routes.logInScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginScreen(),
                ));
      case Routes.signUpScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<SignupCubit>(),
                  child: const SignupScreen(),
                ));
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const HomeScreen(),
                ));
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text("No Route Define for ${settings.name}"),
            ),
          ),
        );
    }
  }
}
