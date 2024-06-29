import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/onboarding/logo.png",
              height: 200.h,
              width: 200.w,
              fit: BoxFit.contain,
            ),
            Gap(15.h),
            Text(
              "O'zbekiston\nSavdo - Sanoat\nPalatasi",
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 4, 55, 132)),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

void navigateToNextPage(BuildContext context) {
  Future.delayed(const Duration(seconds: 2), () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  LoginScreen()),
    );
  });
}
