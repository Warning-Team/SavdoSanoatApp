// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num).toInt(),
      login: json['login'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      phoneNumber: json['phoneNumber'] as String,
      workPlace: json['workPlace'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'login': instance.login,
      'password': instance.password,
      'phoneNumber': instance.phoneNumber,
      'workPlace': instance.workPlace,
    };
