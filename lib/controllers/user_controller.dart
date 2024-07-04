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
  ) async {
    notifyListeners();

    return userHttpService.editUser(
      newName,
      newSurname,
      newPhoneNumber,
    );
  }

  Future<void> editImage(String imageUri) async {
    notifyListeners();
    return userHttpService.editPhoto(imageUri);
  }
}
