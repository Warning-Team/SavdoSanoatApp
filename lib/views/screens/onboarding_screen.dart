import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:savdosanoatapp/utils/mediaquery.dart';
import 'package:savdosanoatapp/views/screens/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextPage(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/onboarding/logo.png",
                  height: 200.h,
                  width: 200.w,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
          Text(
            "O'zbekiston Savdo - Sanoat Palatasi",
            style: TextStyle(fontSize: 20.sp, color: const Color.fromARGB(60, 238, 238, 238)),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

void navigateToNextPage(BuildContext context) {
  Future.delayed( const Duration(seconds: 1), () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  });
}
