import 'package:flutter/material.dart';
import 'package:omar_ahmad_advanced_concept/core/routing/routes.dart';
import 'package:omar_ahmad_advanced_concept/features/login/ui/login_screen.dart';
import 'package:omar_ahmad_advanced_concept/features/onboarding/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
            builder: (context) => const OnboardingScreen());

      case Routes.logInScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
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
