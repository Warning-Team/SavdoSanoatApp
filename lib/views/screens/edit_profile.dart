import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class EditProfile extends StatelessWidget {

  EditProfile({super.key});
  final nameController = TextEditingController(text: "Alex");
  final lastNmaeController = TextEditingController(text: "Marshall");
  final phoenController = TextEditingController(text: "940070707");

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: const NetworkImage(
                        "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg",
                      ),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.photo_camera,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(40.h),
                TextField(
                  textInputAction: TextInputAction.next,
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Name",
                  ),
                ),
                const Gap(20),
                TextField(
                  textInputAction: TextInputAction.next,
                  controller: lastNmaeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Last Name",
                  ),
                ),
                const Gap(20),
                IntlPhoneField(
                  textInputAction: TextInputAction.done,
                  initialCountryCode: "UZ",
                  controller: phoenController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Phone Number",
                  ),
                ),
                const Gap(36),
                FilledButton(
                  onPressed: () {},
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 120.0.w, vertical: 15),
                    child: const Text(
                      "save",
                      style: TextStyle(fontSize: 18),
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
