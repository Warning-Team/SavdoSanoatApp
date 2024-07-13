import 'dart:convert';

import 'package:savdosanoatapp/models/client.dart';
import 'package:http/http.dart' as http;

class ClientController {
  final data = Client(
    id: 54321,
    companyName: "AzamatMCHJ",
    eId: 12345,
    phoneNumber: "+998911234567",
    stir: 12345678912345,
  );

  static Future<Map> getClinetByClientId(int cId) async {
    final url = Uri.parse('https://savdosanoatapp-default-rtdb.firebaseio.com/clients.json?orderBy="id"&equalTo=$cId');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map;
      return data.values.first;
    } else {
      return {
        "error": "malumot topilmadi",
      };
    }
  }
}
