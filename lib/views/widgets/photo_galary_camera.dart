import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:savdosanoatapp/controllers/user_controller.dart';
import 'package:savdosanoatapp/views/widgets/progres_indicatior.dart';

// ignore: must_be_immutable
class PhotoGalaryCamera extends StatefulWidget {
  PhotoGalaryCamera({super.key, required this.imageFile});
  File? imageFile;

  @override
  State<PhotoGalaryCamera> createState() => _PhotoGalaryCameraState();
}

class _PhotoGalaryCameraState extends State<PhotoGalaryCamera> {
  late final UserController userController;

  @override
  void initState() {
    // TODO: implement initState
     userController = context.read<UserController>();
    super.initState();
  }

  void _uploadImage() async {
    if (widget.imageFile != null && userController.user != null) {
      ProgresIndicatior.showProgressDialog(context);
      print(1);
      await userController.editImage(
          widget.imageFile!, userController.user!.userId);
      print(2);
      if (context.mounted) {
        print(3);
        Navigator.pop(context); // Close the progress dialog
        Navigator.pop(context); // Close the image picker dialog
      }
      print(4);
    } else {
      print("qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
      print(widget.imageFile);
      print(userController.user!.id);
      print("qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      children: [
        const Gap(30),
        widget.imageFile != null
            ? CircleAvatar(
                radius: 140,
                backgroundImage: FileImage(
                  widget.imageFile!,
                ),
              )
            : const Text("Please choose a photo"),
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            FilledButton(
              onPressed: _uploadImage,
              child: const Text("Save"),
            ),
          ],
        ),
      ],
    );
  }
}