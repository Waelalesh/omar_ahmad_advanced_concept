import 'package:flutter/material.dart';
import 'package:omar_ahmad_advanced_concept/core/di/dependency_injection.dart';
import 'package:omar_ahmad_advanced_concept/core/routing/app_router.dart';
import 'package:omar_ahmad_advanced_concept/doc_app.dart';

void main() {
  setupGetIt();
  runApp(DocApp(
    router: AppRouter(),
  ));
}
