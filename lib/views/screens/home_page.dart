import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:savdosanoatapp/controllers/user_controller.dart';
import 'package:savdosanoatapp/models/user.dart';
import 'package:savdosanoatapp/views/screens/add_new_request.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final userController = context.watch<UserController>();
    User user = userController.user!;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 55.w,
        leading: Row(
          children: [
            Gap(10.w),
            CircleAvatar(
              backgroundImage: user.imageUrl.isEmpty ? const AssetImage("assets/profile/default.png") : NetworkImage(userController.user!.imageUrl),
              maxRadius: 22.w,
            ),
          ],
        ),
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNewRequest(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0).w,
        child: Column(
          children: [
            Text(
              user.workPlace,
              style: TextStyle(fontSize: 18.w),
            )
          ],
        ),
      ),
    );
  }
}
