import 'package:flutter/material.dart';
import 'package:travel_app/constants/string_const.dart';
import 'package:travel_app/presentation/screens/home_screen.dart';
import 'package:travel_app/routing/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: StringConst.appTitle,
      theme: ThemeData(
        brightness: .light
      ),
      builder: (_, child) => child!,
      routerConfig: router,
    );
  }
}