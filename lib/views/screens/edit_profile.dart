import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:savdosanoatapp/controllers/user_controller.dart';

// ignore: must_be_immutable
class EditProfile extends StatefulWidget {
  const EditProfile({
    super.key,
  });

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final nameController = TextEditingController();
  late final UserController userController;

  final lastNameController = TextEditingController();
  final imageController = TextEditingController();
  final phoenController = TextEditingController();

  @override
  void initState() {
    super.initState();
    userController = context.watch<UserController>();

    nameController.text = userController.user!.name;
    phoenController.text = userController.user!.phoneNumber;
    lastNameController.text = userController.user!.surname;
    if (userController.user!.imageUrl != "") {
      imageController.text = userController.user!.imageUrl;
    }

    // print("object");
    // print(userController.user!.imageUrl);
    // print("object");
  }

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
                      backgroundImage: userController.user!.imageUrl.isNotEmpty
                          ? NetworkImage(userController.user!.imageUrl)
                          : const AssetImage("assets/profile/default.png"),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (ctx) {
                                return AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize
                                        .min, // To constrain the AlertDialog size
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Enter image URL"),
                                      TextField(
                                        controller: imageController,
                                        decoration: const InputDecoration(
                                          hintText: "Enter URL",
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Back"),
                                          ),
                                          FilledButton(
                                            onPressed: () {
                                              userController.editImage(
                                                  imageController.text);
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Save"),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );

                            userController.editImage("");
                          },
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
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Last Name",
                  ),
                ),
                const Gap(20),
                TextField(
                  textInputAction: TextInputAction.done,
                  controller: phoenController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Phone Number",
                  ),
                ),
                const Gap(36),
                FilledButton(
                  onPressed: () {
                    userController.editUser(
                      nameController.text,
                      phoenController.text,
                      lastNameController.text,
                    );
                    Navigator.of(context).pop();
                  },
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
