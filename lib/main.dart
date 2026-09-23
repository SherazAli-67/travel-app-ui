import 'package:flutter/material.dart';
import 'package:travel_app/constants/string_const.dart';
import 'package:travel_app/core/app_colors.dart';
import 'package:travel_app/routing/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: StringConst.appTitle,
      theme: ThemeData(
        brightness: .light,
        fontFamily: StringConst.appFontFamily,
        scaffoldBackgroundColor: AppColors.baseDark,
        colorScheme: .fromSeed(
          seedColor: AppColors.brandLime,
          brightness: .light,
          primary: AppColors.brandLime,
          surface: AppColors.baseDark,
        ),
      ),
      builder: (_, child) => child!,
      routerConfig: router,
    );
  }
}
