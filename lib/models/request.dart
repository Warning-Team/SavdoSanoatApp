class Request {
  final int eId;
  final int cId;
  final DateTime date;
  final String description;
  final List<String> imageUrls;
  final int id;

  Request({
    required this.eId,
    required this.cId,
    required this.date,
    required this.description,
    required this.imageUrls,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'eId': eId,
      'cId': cId,
      'date': date.toIso8601String(),
      'description': description,
      'imageUrls': imageUrls,
      'id': id,
    };
  }
}
