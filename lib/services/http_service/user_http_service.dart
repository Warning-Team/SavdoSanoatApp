import 'dart:convert';

import 'package:http/http.dart' as http;

class UserHttpService {
  Future<void> editUser(
      String newName, String newSurname, String newNumber,String id) async {
    Uri url = Uri.parse(
        "https://savdosanoatapp-default-rtdb.firebaseio.com/users/$id.json");
    Map<String, dynamic> userData = {
      "name": newName,
      "surname": newSurname,
      "phoneNumber": newNumber,
    };
    await http.patch(
      url,
      body: jsonEncode(userData),
    );
  }

  Future<void> editPhoto(String imageUrl) async {
    Uri url = Uri.parse(
        "https://savdosanoatapp-default-rtdb.firebaseio.com/users/-O0J-mk8ZKsXnILtHDXS.json");
    Map<String, dynamic> userData = {
      "imageUri": imageUrl,
    };
    await http.patch(
      url,
      body: jsonEncode(userData),
    );
  }
}
