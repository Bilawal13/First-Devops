import 'package:fav_places/models/place_model.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/legacy.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(dbPath, 'places.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT, loc_lat REAL, loc_lng REAL, address TEXT)',
      );
    },
    version: 1,
  );

  return db;
}

class UserPlace extends StateNotifier<List<PlaceModel>> {
  UserPlace() : super(const []);

  List<PlaceModel> get places {
    return [...state];
  }

  Future<void> loadPlaces() async {
    final db = await _getDatabase();
    final results = await db.query('user_places');
    final places =
        results
            .map(
              (row) => PlaceModel(
                id: row['id'] as String,
                title: row['title'] as String,
                image: File(row['image'] as String),
                location: PlaceLocation(
                  latitude: row['loc_lat'] as double,
                  longitude: row['loc_lng'] as double,
                  address: row['address'] as String,
                ),
              ),
            )
            .toList();
    state = places;
  }

  void addPlace(String title, File image, PlaceLocation location) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(image.path);
    final copiedImage = await image.copy('${appDir.path}/$fileName');

    final newPlace = PlaceModel(
      title: title,
      image: copiedImage,
      location: location,
    );

    final db = await _getDatabase();

    db.insert('user_places', {
      'id': DateTime.now().toString(),
      'title': newPlace.title,
      'image': copiedImage.path,
      'loc_lat': newPlace.location.latitude,
      'loc_lng': newPlace.location.longitude,
      'address': newPlace.location.address,
    });
    state = [newPlace, ...state];
  }
}

final userPlaceProvider = StateNotifierProvider<UserPlace, List<PlaceModel>>((
  ref,
) {
  return UserPlace();
});
