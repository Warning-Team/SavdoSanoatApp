import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:savdosanoatapp/controllers/user_controller.dart';
import 'package:savdosanoatapp/services/http_service/user_login_service.dart';
import 'package:savdosanoatapp/utils/mediaquery.dart';
import 'package:savdosanoatapp/views/screens/maneger_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  final formkey = GlobalKey<FormState>();
  bool isPasswordVisablety = true;
  String logindata = "";
  String passworddata = "";
  saveLogin() async {
    if (formkey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      formkey.currentState!.save();
      Map<String, dynamic> checkdata = await UserLoginService.checkUser(logindata, passworddata);

      if (checkdata['status'] == true) {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        await sharedPreferences.setString('date', DateTime.now().toString());
        await sharedPreferences.setString('user', checkdata['user'].userId);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ManegerPage(
              user: checkdata['user'],
            ),
          ),
        );
      } else {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (ctx) => AlertDialog(
            content: Text(
              checkdata['action'],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Qayta urinish",
                ),
              )
            ],
          ),
        );
      }
      isLoading = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: PhoneSize.screenHeight(context),
        width: PhoneSize.screenWidth(context),
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                Gap(10.h),
                InkWell(
                  onTap: saveLogin,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10.h),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.blue),
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : Text(
                            "Log in",
                            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.white),
                          ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
