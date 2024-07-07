class User {
  int id;
  String userId;
  String name;
  String surname;
  String login;
  String password;
  String phoneNumber;
  String workPlace;
  String role;
  String imageUrl;
  String uId;

  User({
    required this.id,
    required this.userId,
    required this.uId,
    required this.login,
    required this.password,
    required this.name,
    required this.surname,
    required this.phoneNumber,
    required this.workPlace,
    required this.role,
    required this.imageUrl,
  });

  factory User.fromJson(Map<String, dynamic> json, String key) {
    return User(
      id: json['id'] ?? 0, // Providing a default value of 0
      userId: key,
      login: json['login'] ?? '', // Providing default empty string
      password: json['password'] ?? '', // Providing default empty string
      name: json['name'] ?? '', // Providing default empty string
      surname: json['surname'] ?? '', // Providing default empty string
      phoneNumber: json['phoneNumber'] ?? '', // Providing default empty string
      workPlace: json['workPlace'] ?? '', // Providing default empty string
      role: json['role'] ?? '', // Providing default empty string
      imageUrl: json['imageUrl'] ?? '', // Providing default empty string
      uId: json['uId'],
    );
  }

  static Map<String, dynamic> toJson(User user) {
    return {
      'id': user.id,
      'login': user.login,
      'password': user.password,
      'name': user.name,
      'surname': user.surname,
      'workPlace': user.workPlace,
      'role': user.role,
      'phoneNumber': user.phoneNumber,
      'imageUrl': user.imageUrl,
      'uId': user.uId,
    };
  }

  void update(
    String newName,
    String newPhoneNumber,
    String newSurname,
  ) {
    name = newName;
    surname = newSurname;

    phoneNumber = newPhoneNumber;
  }
}
