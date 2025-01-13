import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omar_ahmad_advanced_concept/core/di/dependency_injection.dart';
import 'package:omar_ahmad_advanced_concept/core/helpers/constants.dart';
import 'package:omar_ahmad_advanced_concept/core/helpers/extensions.dart';
import 'package:omar_ahmad_advanced_concept/core/helpers/shared_pref_helper.dart';
import 'package:omar_ahmad_advanced_concept/core/routing/app_router.dart';
import 'package:omar_ahmad_advanced_concept/doc_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupGetIt();
  // to fix texts font bug in flutter_screenutils in release mode
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();
  runApp(DocApp(
    router: AppRouter(),
  ));
}

Future<void> checkIfLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getString(SharedPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
