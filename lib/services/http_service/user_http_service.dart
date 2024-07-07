import 'dart:convert';

import 'package:http/http.dart' as http;

class UserHttpService {
  Future<void> editUser(
      String newName, String newSurname, String newNumber, String id) async {
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

  Future<void> editPhoto(Map data,String id) async {
    Uri url = Uri.parse(
        "https://savdosanoatapp-default-rtdb.firebaseio.com/users/$id.json");
    await http.patch(
      url,
      body: jsonEncode(data),
    );
  }

  
}
