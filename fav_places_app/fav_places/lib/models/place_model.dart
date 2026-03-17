import 'package:uuid/uuid.dart';
import 'dart:io';

final _uuid = Uuid();

class PlaceLocation {
  // blueprint for our location

  const PlaceLocation({
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  final double latitude;
  final double longitude;
  final String address;
}

class PlaceModel {
  PlaceModel({
    required this.title,
    required this.image,
    required this.location,
    String? id,
  }) : id = id ?? _uuid.v4();

  final String id;
  final String title;
  final File image;
  final PlaceLocation location;
}
