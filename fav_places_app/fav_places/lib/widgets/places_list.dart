

import 'package:fav_places/models/place_model.dart';
import 'package:fav_places/screens/places_details.dart';
import 'package:flutter/material.dart';


class PlacesList extends StatelessWidget {
  const PlacesList({super.key , required this.placesList});

  final List<PlaceModel> placesList;
  @override
  Widget build(BuildContext context) {
     Widget content = ListView.builder(
      itemCount: placesList.length,
      itemBuilder:
          (context, index) => ListTile(
            leading: CircleAvatar(
              radius: 26,
              backgroundImage: FileImage(placesList[index].image),
            ),
            title: Text(placesList[index].title , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface),),
            subtitle: Text(placesList[index].location.address , style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.onSurface ,)),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PlacesDetails(place: placesList[index]),
              ),
          ),
    ));

    if (placesList.isEmpty) {
      content =  Center(child: Text('No places added yet' , style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onSurface),),);
    }
    return content;
    
  }
}