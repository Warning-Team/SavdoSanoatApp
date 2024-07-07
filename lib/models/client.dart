class Client {
  String companyName;
  int eId;
  int id;
  String phoneNumber;
  int stir;

  Client({
    required this.id,
    required this.companyName,
    required this.eId,
    required this.phoneNumber,
    required this.stir,
  });

  // factory Client.fromJson(Map<String, dynamic> json, String key) {
  //   return Client(
  //     id: json['id'] ?? 0,
  //     companyName: json['companyName'] ?? "",
  //     eId: json['eId'] ?? 0,
  //     phoneNumber: json['phoneNumber'] ?? "",
  //     stir: json['stir'] ?? 0,
  //   );
  // }
}
