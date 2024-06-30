import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:savdosanoatapp/controllers/user_controller.dart';
import 'package:savdosanoatapp/views/screens/edit_profile.dart';
import 'package:savdosanoatapp/views/screens/home_page.dart';
import 'package:savdosanoatapp/views/screens/login_screen.dart';
import 'package:savdosanoatapp/views/screens/onboarding_screen.dart';
import 'package:savdosanoatapp/views/screens/profile_screen.dart';
import 'package:savdosanoatapp/views/screens/settings.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      child: ChangeNotifierProvider(
        create: (context) {
          return UserController();
        },
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
              pageTransitionsTheme: const PageTransitionsTheme(
                builders: {
                  TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
                },
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: OnboardingScreen(),
          );
        },
      ),
    );
  }
}
