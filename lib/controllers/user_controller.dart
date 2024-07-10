import 'dart:io';

import 'package:flutter/material.dart';
import 'package:savdosanoatapp/models/user.dart';
import 'package:savdosanoatapp/services/http_service/firebase_storage_service.dart';
import 'package:savdosanoatapp/services/http_service/user_http_service.dart';

class UserController extends ChangeNotifier {
  final _firebaseStorageService = FirebaseStorageService();
  UserHttpService userHttpService = UserHttpService();
  User? user;

  Future<void> editUser(
    String newName,
    String newPhoneNumber,
    String newSurname,
    String id,
  ) async {
    user!.name = newName;
    user!.surname = newSurname;
    user!.phoneNumber = newPhoneNumber;
    await userHttpService.editUser(
      newName,
      newSurname,
      newPhoneNumber,
      id,
    );
    notifyListeners();
  }

  Future<void> editImage(
    File file,
    String id,
  ) async {
    final imageUrl = await _firebaseStorageService.uploadFile(file, id);
    user!.imageUrl = imageUrl;

    Map<String, dynamic> userData = {
      "imageUrl": imageUrl,
    };
    await userHttpService.editPhoto(
      userData,
      id,
    );
    notifyListeners();
  }
}
