import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:savdosanoatapp/views/screens/edit_profile.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Back"),
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(
                "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg",
              ),
            ),
            const Gap(20),
            const Text(
              "Alex Marshall",
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.w600),
            ),
            const Text(
              "+998(94)007-07-07",
              style: TextStyle(fontSize: 18),
            ),
            Gap(36),
            FilledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => EditProfile()),
                );
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
                            fontSize: 20, fontWeight: FontWeight.w500),
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
