import 'package:flutter/material.dart';
import 'package:omar_ahmad_advanced_concept/core/assets_gen/assets.gen.dart';
import 'package:omar_ahmad_advanced_concept/core/theme/styles.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Assets.svgs.docLogoLowOpacity.svg(),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Colors.white.withOpacity(0.0)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [0.14, 0.4]),
          ),
          child: Assets.images.onboardingDoctor.image(),
        ),
        Positioned(
          bottom: 30,
          child: Text(
            "Best Doctor\nAppointment App",
            textAlign: TextAlign.center,
            style: TextStyles.font32BlueBold.copyWith(height: 1.4),
          ),
        )
      ],
    );
  }
}
