import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:savdosanoatapp/controllers/add_request_controller.dart';

class AddNewRequest extends StatefulWidget {
  const AddNewRequest({super.key});

  @override
  State<AddNewRequest> createState() => _AddNewRequestState();
}

class _AddNewRequestState extends State<AddNewRequest> {
  final addRequestCountroller = AddRequestController();
  String? stirError;
  String? descriptionError;
  final stirCountroller = TextEditingController();
  final descriptionCountroller = TextEditingController();
  List<File> imageFiles = [];

  sumbit() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Request"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.numberWithOptions(),
              controller: stirCountroller,
              decoration: InputDecoration(
                errorText: stirError,
                border: const OutlineInputBorder(),
                labelText: "Stir",
              ),
              onChanged: (value) async {
                int? stir = int.tryParse(value);
                if (stir != null) {
                  Map<String, dynamic> response = await addRequestCountroller.checkClient(value);
                  print(response);
                  if (response['isFind'] == true) {
                    stirError = null;
                  } else {
                    stirError = "Stir topilmadi";
                  }
                } else {
                  stirError = "Stir xato kiritildi";
                }

                setState(() {});
              },
            ),
            Gap(25.h),
            TextField(
              controller: descriptionCountroller,
              decoration: InputDecoration(
                errorText: descriptionError,
                border: OutlineInputBorder(),
                hintText: "Description",
              ),
              minLines: 2,
              maxLines: 5,
            ),
            FilledButton(
              onPressed: () {},
              child: const Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
