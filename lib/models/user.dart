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

  User({
    required this.id,
    required this.userId,
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
      id: json['id'],
      userId: key,
      login: json['login'],
      password: json['password'],
      name: json['name'],
      surname: json['surname'],
      phoneNumber: json['phoneNumber'],
      workPlace: json['workPlace'],
      role: json['role'],
      imageUrl: json['imageUrl'],
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
    };
  }
}
