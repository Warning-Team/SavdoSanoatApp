import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:savdosanoatapp/controllers/user_controller.dart';
import 'package:savdosanoatapp/views/widgets/photo_galary_camera.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? imageFile;
  late final UserController userController;

  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    userController = context.read<UserController>();

    nameController.text = userController.user!.name;
    phoneController.text = userController.user!.phoneNumber;
    lastNameController.text = userController.user!.surname;
  }

  void _uploadImage(ImageSource imageSource) async {
    final imagePicker = ImagePicker();
    final XFile? pickedImage = await imagePicker.pickImage(source: imageSource);
    if (pickedImage != null) {
      setState(() {
        imageFile = File(pickedImage.path);
      });
      _showImageDialog();
    }
  }

  void _showImageDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return PhotoGalaryCamera(imageFile: imageFile);
      },
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.of(context).pop();
                  _uploadImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.of(context).pop();
                  _uploadImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
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
                      backgroundImage: userController.user!.imageUrl.isNotEmpty ? NetworkImage(userController.user!.imageUrl) : const AssetImage("assets/profile/default.png"),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          onPressed: () {
                            _showPicker(context);
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
                  controller: phoneController,
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
                      phoneController.text,
                      lastNameController.text,
                      userController.user!.userId,
                    );
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 120.0.w, vertical: 15),
                    child: const Text(
                      "Save",
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
