import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:savdosanoatapp/controllers/request_controller.dart';
import 'package:savdosanoatapp/controllers/user_controller.dart';
import 'package:savdosanoatapp/models/request.dart';
import 'package:savdosanoatapp/views/widget/animated_widget.dart';
import 'package:savdosanoatapp/views/widget/loding_widget.dart'; // Corrected typo in import

class AddNewRequest extends StatefulWidget {
  const AddNewRequest({super.key});

  @override
  State<AddNewRequest> createState() => _AddNewRequestState();
}

class _AddNewRequestState extends State<AddNewRequest> {
  final _picker = ImagePicker();
  late RequestController addRequestController; // Corrected type definition
  final formKey = GlobalKey<FormState>();
  late Map<String, dynamic> response;

  String? stirError;
  String? descriptionError;
  final stirController = TextEditingController();
  final descriptionController = TextEditingController();
  List<File> imageFiles = [];
  bool isUploading = false;
  double uploadProgress = 0.0;

  Future<void> getImageFromCamera() async {
    final XFile? imageCamera = await _picker.pickImage(source: ImageSource.camera);
    if (imageCamera != null) {
      setState(() {
        imageFiles.add(File(imageCamera.path));
      });
    }
  }

  void submit() async {
    final userController = context.read<UserController>();
    if (formKey.currentState!.validate() && descriptionError == null && stirError == null) {
      LodingWidget.showLoadingDialog(context); // Corrected typo in function call

      final client = response['status'].values.toList().first as Map<String, dynamic>; // Corrected type definition
      final int eId = userController.user!.id;
      final int cId = client['id']; // Replace with actual client ID
      final DateTime date = DateTime.now();
      final String description = descriptionController.text;
      final List<String> imageUrls = [];
      final int id = DateTime.now().millisecondsSinceEpoch;

      // Upload images and get URLs
      final stream = addRequestController.addImageToFirestore(imageFiles, client['companyName'], userController.user!.name);
      await for (final snapshot in stream) {
        if (snapshot.state == TaskState.success) {
          final downloadUrl = await snapshot.ref.getDownloadURL();
          imageUrls.add(downloadUrl);
        }
      }

      // Create a new request
      final request = Request(
        eId: eId,
        cId: cId,
        date: date,
        description: description,
        imageUrls: imageUrls,
        id: id,
        fId: "",
      );

      // Save the request to Firestore
      await addRequestController.saveRequestToFirestore(request);
      Navigator.pop(context); // Close loading dialog
      Navigator.pop(context); // Close AddNewRequest screen
    }
  }

  @override
  Widget build(BuildContext context) {
    addRequestController = context.read<RequestController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Request"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: const TextInputType.numberWithOptions(),
                controller: stirController,
                decoration: InputDecoration(
                  errorText: stirError,
                  border: const OutlineInputBorder(),
                  labelText: "STIR",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "STIR kiritilishi shart";
                  } else if (int.tryParse(value) == null) {
                    return "STIR noto'g'ri kiritilgan";
                  }
                  return null;
                },
                onChanged: (value) async {
                  int? stir = int.tryParse(value);
                  if (stir != null) {
                    response = await addRequestController.checkClient(value);
                    if (response['isFind'] == true) {
                      stirError = null;
                    } else {
                      stirError = "STIR topilmadi";
                    }
                  } else {
                    stirError = "STIR xato kiritildi";
                  }
                  setState(() {});
                },
              ),
              Gap(25.h),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: descriptionController,
                decoration: InputDecoration(
                  errorText: descriptionError,
                  border: const OutlineInputBorder(),
                  hintText: "Description",
                ),
                minLines: 3,
                maxLines: 5,
                maxLength: 300,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Description kiritilishi shart";
                  }
                  return null;
                },
              ),
              Gap(25.h),
              Wrap(
                spacing: 10.w,
                runSpacing: 10.h,
                children: [
                  for (int i = 0; i < imageFiles.length; i++) // Corrected condition to iterate through all imageFiles
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.file(
                          imageFiles[i],
                          height: 100.h,
                          width: 100.w,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          right: -5,
                          top: -5,
                          child: InkWell(
                            onTap: () {
                              imageFiles.removeAt(i);
                              setState(() {});
                            },
                            child: Container(
                              height: 20.h,
                              width: 20.w,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.close,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (imageFiles.length < 6)
                    InkWell(
                      onTap: () async {
                        await getImageFromCamera();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue.shade200,
                            width: 5,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 100.h,
                        width: 100.w,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.add_a_photo,
                          color: Colors.blue.shade400,
                        ),
                      ),
                    ),
                ],
              ),
              Gap(25.h),
              if (isUploading) AnimatedUploadWidget(progress: uploadProgress),
              if (!isUploading)
                Center(
                  child: ElevatedButton(
                    // Changed to ElevatedButton
                    onPressed: submit,
                    child: const Text("Save"),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
