import 'dart:convert';

import 'package:http/http.dart' as http;

class AddRequestController {
  checkClient(String stir) async {
    final url = Uri.parse('https://savdosanoatapp-default-rtdb.firebaseio.com/clients.json?orderBy="stir"&equalTo=$stir');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map;

      if (data.isNotEmpty) {
        return {
          'isFind': true,
          'status': data,
        };
      } else {
        return {
          'isFind': false,
          'status': 'Malumot topilmadi',
        };
      }
    } else {
      return {
        'isFind': false,
        'status': 'Check your internet',
      };
    }
  }

  


}
