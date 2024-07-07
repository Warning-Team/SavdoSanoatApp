import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;

class ClientsHttpService {
  final firebaseDatabase = FirebaseDatabase.instance;

  // Future<Map<String, dynamic>?> getClient(int id) async {
  //   final url = Uri.parse(
  //       "https://savdosanoatapp-default-rtdb.firebaseio.com/clients/$id.json");
  //   final response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     return 
  //   }
  // }
}
