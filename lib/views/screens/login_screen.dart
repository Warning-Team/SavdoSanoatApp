import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:savdosanoatapp/services/http_service/user_login_service.dart';
import 'package:savdosanoatapp/utils/inputvalidatsiya.dart';
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
  final formKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;
  String loginData = "";
  String passwordData = "";

  Future<void> saveLogin() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      if (!Validate.passportSerialNumber(loginData)) {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (ctx) => AlertDialog(
            content: const Text(
              "Login format xato. To'g'ri format: AB3501234",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Qayta urinish"),
              ),
            ],
          ),
        );
        return;
      }

      setState(() {
        isLoading = true;
      });

      Map<String, dynamic> checkData = await UserLoginService.checkUser(loginData, passwordData);

      if (checkData['status'] == true) {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        await sharedPreferences.setString('date', DateTime.now().toString());
        await sharedPreferences.setString('user', checkData['user'].userId);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ManegerPage(
              user: checkData['user'],
            ),
          ),
        );
      } else {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (ctx) => AlertDialog(
            content: Text(
              checkData['action'],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Qayta urinish"),
              ),
            ],
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
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
            key: formKey,
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
                    loginData = value!;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  obscureText: isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Parol',
                    labelStyle: const TextStyle(color: Colors.white),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        isPasswordVisible ? CupertinoIcons.eye_slash : CupertinoIcons.eye_fill,
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
                    passwordData = value!;
                  },
                ),
                Gap(10.h),
                InkWell(
                  onTap: isLoading ? null : saveLogin,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue,
                    ),
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : Text(
                            "Log in",
                            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.white),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
