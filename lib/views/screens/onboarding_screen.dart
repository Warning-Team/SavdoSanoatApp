import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:savdosanoatapp/models/user.dart';
import 'package:savdosanoatapp/services/http_service/user_login_service.dart';
import 'package:savdosanoatapp/utils/appconst.dart';
import 'package:savdosanoatapp/views/screens/maneger_page.dart';
import 'package:savdosanoatapp/views/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  User? user;
  @override
  void initState() {
    super.initState();
    navigateToNextPage(context);
  }

  Future checkEnter() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? date = sharedPreferences.getString('date');
    String? userId = sharedPreferences.getString('user');
    if (date != null && userId != null) {
      user = await UserLoginService.getUser(userId);
      DateTime dateTime = DateTime.parse(date);
      Appconst.isEnter = DateTime.now().isBefore(dateTime);
    }
  }

  void navigateToNextPage(BuildContext context) async {
    await checkEnter();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => !Appconst.isEnter ? ManegerPage(user: user!) : const LoginScreen()),
      );
    });
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
