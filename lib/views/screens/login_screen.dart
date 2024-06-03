import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:savdosanoatapp/utils/mediaquery.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey formkey = GlobalKey();
  final mediaQuery = Mediaquery();
  bool isPasswordVisablety = true;
  String logindata = "";
  String passworddata = "";

  saveLogin() {
    // if (formkey.currentState.activate) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: mediaQuery.screenHeight(context),
        width: mediaQuery.screenWidth(context),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade300,
              Colors.blue.shade800,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Login',
                    labelStyle: const TextStyle(color: Colors.white),
                    prefixIcon: const Icon(Icons.person, color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0.r),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0.r),
                    ),
                    helperText: "Namuna: AB3501234",
                    helperStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "xato login kiritildi";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    logindata = value!;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  obscureText: isPasswordVisablety,
                  decoration: InputDecoration(
                    labelText: 'Parol',
                    labelStyle: const TextStyle(color: Colors.white),
                    suffixIcon: IconButton(
                      onPressed: () {
                        isPasswordVisablety = !isPasswordVisablety;
                        setState(() {});
                      },
                      icon: Icon(
                        isPasswordVisablety ? CupertinoIcons.eye_slash : CupertinoIcons.eye_fill,
                        color: Colors.white,
                      ),
                    ),
                    prefixIcon: const Icon(Icons.lock, color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0.r),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0.r),
                    ),
                    helperText: "Namuna: Akmal@1234",
                    helperStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "xato parol kiritildi";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    passworddata = value!;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
