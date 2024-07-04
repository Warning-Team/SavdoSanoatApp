import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:savdosanoatapp/controllers/user_controller.dart';
import 'package:savdosanoatapp/utils/extensions/phone_number.dart';
import 'package:savdosanoatapp/views/screens/edit_profile.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final UserController userController;

  List options = [
    {
      "icon": Icons.settings,
      "title": "Settings",
    },
    {
      "icon": Icons.support_agent,
      "title": "Support",
    },
    {
      "icon": Icons.info_outline_rounded,
      "title": "About us",
    },
  ];
  @override
  void initState() {
    super.initState();
    userController = context.read<UserController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: userController.user!.imageUrl.isNotEmpty
                  ? NetworkImage(userController.user!.imageUrl)
                  : const AssetImage("assets/profile/default.png"),
            ),
            const Gap(20),
            Text(
              "${userController.user!.name} ${userController.user!.surname}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            Text(
              userController.user!.phoneNumber.phone_format(),
              style: TextStyle(fontSize: 18),
            ),
            Gap(36),
            FilledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => EditProfile(),
                  ),
                );
                setState(() {});
              },
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 130.0.w, vertical: 15),
                child: const Text(
                  "Edit",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const Gap(45),
            Container(
              width: double.infinity,
              height: 2,
              color: const Color.fromARGB(255, 188, 184, 184),
            ),
            Flexible(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: options.length,
                itemBuilder: (ctx, index) {
                  return InkWell(
                    child: ListTile(
                      leading: Icon(options[index]["icon"], size: 28),
                      title: Text(
                        options[index]["title"],
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ),
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
