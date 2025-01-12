import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omar_ahmad_advanced_concept/core/routing/app_router.dart';
import 'package:omar_ahmad_advanced_concept/core/routing/routes.dart';
import 'package:omar_ahmad_advanced_concept/core/theme/colors.dart';

class DocApp extends StatelessWidget { 
  final AppRouter router;
  const DocApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) { 
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.homeScreen,
          theme: ThemeData(
              primaryColor: ColorsManager.mainBlue,
              scaffoldBackgroundColor: Colors.white),
          onGenerateRoute: router.generateRoute,
        ));
  }
}
