import 'package:fav_places/models/place_model.dart';
import 'package:fav_places/screens/map.dart';
import 'package:flutter/material.dart';

class PlacesDetails extends StatelessWidget{

  const PlacesDetails({ required this.place ,super.key});

  final PlaceModel place;

  String get locationImage { // to show the preview of the location on the screen using google maps static api
    final latitude = place.location.latitude;
    final longitude = place.location.longitude;

    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:A%7C$latitude,$longitude&key=AIzaSyCwVhfsHCODIEOP3NtNyAjNo3M3es738eM';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Place Details'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Stack(
        children: [
          Image.file(place.image , fit: BoxFit.cover , width: double.infinity, height: double.infinity,),
          Positioned(bottom: 0, left: 0, right: 0, child: Column(
            children: [
              GestureDetector(onTap: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context) => MapScreen(location: place.location, isSelecting: false))); } ,child: CircleAvatar(radius: 40, backgroundImage: NetworkImage(locationImage),)),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black54,
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(place.location.address , textAlign: TextAlign.center,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface),),
              )
            ]
          ))
        ],
      )
      );
  }
}