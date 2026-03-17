import 'package:fav_places/providers/user_place.dart';
import 'package:fav_places/screens/new_place.dart';
import 'package:fav_places/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Places extends ConsumerStatefulWidget {
  const Places({super.key});

  @override
  ConsumerState<Places> createState() => _PlacesState();
}

// void _addItem() {
//   Navigator.of(
//     context,
//   ).push(MaterialPageRoute(builder: (context) => NewPlace()));

//   // if (newPlace == null) {
//   //   return;
//   // }

//   // setState(() {
//   //   _placesList.add(newPlace);
//   // });
// }

class _PlacesState extends ConsumerState<Places> {
  late Future<void> _placesFuture;

  @override
  void initState() {
    super.initState();
    _placesFuture = ref.read(userPlaceProvider.notifier).loadPlaces();
  }

  @override
  Widget build(BuildContext context) {
    final userPlaces = ref.watch(userPlaceProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => NewPlace()));
            },
            icon: Icon(Icons.add),
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: _placesFuture,
          builder:
              (context, snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? const Center(child: CircularProgressIndicator())
                      : PlacesList(placesList: userPlaces),
        ),
      ),
    );
  }
}
