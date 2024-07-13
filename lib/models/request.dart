import 'package:cloud_firestore/cloud_firestore.dart';

class Request {
  final int eId;
  final int cId;
  final DateTime date;
  final String description;
  final List<String> imageUrls;
  final int id;
  final String fId;
  final double lat;
  final double long;

  Request({
    required this.eId,
    required this.cId,
    required this.date,
    required this.description,
    required this.imageUrls,
    required this.id,
    required this.fId,
    required this.lat,
    required this.long,
  });

  // Convert Request object to a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'eId': eId,
      'cId': cId,
      'date': date.toIso8601String(),
      'description': description,
      'imageUrls': imageUrls,
      'id': id,
      'lat': lat,
      'long': long,
    };
  }

  // Factory method to create a Request object from a QueryDocumentSnapshot
  factory Request.fromQuery(QueryDocumentSnapshot query) {
    return Request(
      fId: query.id,
      eId: query['eId'],
      cId: query['cId'],
      date: DateTime.parse(query['date']),
      description: query['description'],
      imageUrls: List<String>.from(query['imageUrls']),
      id: query['id'],
      lat: query['lat'],
      long: query['long'],
    );
  }
}
