import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:savdosanoatapp/models/user.dart';
import 'package:savdosanoatapp/services/auth_user_fairbases.dart';

class UserLoginService {
  static Future<Map<String, dynamic>> checkUser(String login, String password) async {
    final url = Uri.parse('https://savdosanoatapp-default-rtdb.firebaseio.com/users.json?orderBy="login"&equalTo="$login"');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      if (jsonData != null && jsonData.isNotEmpty) {
        Map<String, dynamic> data = jsonData as Map<String, dynamic>;
        String key = data.keys.first;
        Map<String, dynamic> userData = data[key] as Map<String, dynamic>;

        if (userData['login'] == login && userData['password'] == password) {
          final user = User.fromJson(userData, key);
          await Authuserfairbases.login(email: "${user.name}${user.surname}@gmail.com", password: user.password);
          return {
            'action': 'Hammasi joyida shaxsiy kabinetingizga hush kelibsiz',
            'status': true,
            'user': User.fromJson(userData, key),
          };
        } else {
          return {
            'action': 'Parolingiz xato, tekshirib qaytadan kiriting',
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
        'action': 'Internet muammosi bor, tekshirib qaytadan urinib ko\'ring',
        'status': false,
      };
    }
  }

  static Future<User> getUser(String userId) async {
    final url = Uri.parse('https://savdosanoatapp-default-rtdb.firebaseio.com/users/$userId.json');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return User.fromJson(data, userId);
    } else {
      throw Exception('Foydalanuvchi ma\'lumotlari yuklanmadi');
    }
  }
}
