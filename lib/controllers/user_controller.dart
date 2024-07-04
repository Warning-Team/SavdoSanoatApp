import 'package:flutter/material.dart';
import 'package:savdosanoatapp/models/user.dart';
import 'package:savdosanoatapp/services/http_service/user_http_service.dart';

class UserController extends ChangeNotifier {
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

  Future<void> editImage(String imageUri) async {
    await userHttpService.editPhoto(imageUri);
    notifyListeners();
  }
}
