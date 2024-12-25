import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omar_ahmad_advanced_concept/core/di/dependency_injection.dart';
import 'package:omar_ahmad_advanced_concept/core/routing/app_router.dart';
import 'package:omar_ahmad_advanced_concept/doc_app.dart';

void main(i) async {
  setupGetIt();
  // to fix texts font bug in flutter_screenutils in release mode
  await ScreenUtil.ensureScreenSize();
  runApp(DocApp(
    router: AppRouter(),
  ));
}
