import 'package:flutter/material.dart';
import 'package:savdosanoatapp/utils/mediaquery.dart';
import 'package:savdosanoatapp/views/screens/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // final mediaQuery = Mediaquery();

  @override
  void initState() {
    super.initState();
    navigateToNextPage(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/onboarding/logo.png",

              // height: mediaQuery.screenHeight(context),
              // width: mediaQuery.screenWidth(context),
              // fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

void navigateToNextPage(BuildContext context) {
  Future.delayed(Duration(seconds: 1), () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  });
}
