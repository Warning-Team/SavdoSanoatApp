import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int id;
  String name;
  String surname;
  String login;
  String password;
  String phoneNumber;
  String workPlace;

  User({
    required this.id,
    required this.login,
    required this.password,
    required this.name,
    required this.surname,
    required this.phoneNumber,
    required this.workPlace,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }
}
