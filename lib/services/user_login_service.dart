import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:savdosanoatapp/models/user.dart';

class UserLoginService {
  static Future<Map<String, dynamic>> checkUser(String login, String password) async {
    final url = Uri.parse('https://savdosanoatapp-default-rtdb.firebaseio.com/users.json?orderBy="login"&equalTo="$login"');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsondata = jsonDecode(response.body);
      if (jsondata != null) {
        Map<String, dynamic> data = jsondata as Map<String, dynamic>;
        Map<String, dynamic> userdata = data.values.toList()[0] as Map<String, dynamic>;

        if (userdata['login'] == login && userdata['password'] == password) {
          return {
            'action': 'Hammasi joyida shaxsiy kabinetingizga hush kelibsiz',
            'status': true,
            'user': userdata,
          };
        } else {
          return {
            'action': 'parlingiz xato tekshrib qaytadan kriting',
            'status': false,
          };
        }
      } else {
        return {
          'action': 'Bunday foydalanuvchi mavjud emas',
          'status': false,
        };
      }
    } else {
      return {
        'action': 'Internetingizda muamo bor tekshrib qaytadan urining',
        'status': false,
      };
    }
  }
}
