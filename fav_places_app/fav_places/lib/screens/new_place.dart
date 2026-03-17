import 'package:fav_places/models/place_model.dart';
import 'package:fav_places/providers/user_place.dart';
import 'package:fav_places/widgets/image_input.dart';
import 'package:fav_places/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

class NewPlace extends ConsumerStatefulWidget {
  const NewPlace({super.key});

  @override
  ConsumerState<NewPlace> createState() {
    return _NewPlace();
  }
}

class _NewPlace extends ConsumerState<NewPlace> {
  final _titleController = TextEditingController();
  File? selectedImage;
  PlaceLocation? selectedLocation;

  void _savePlace() {
    final enteredTitle = _titleController.text;
    if (enteredTitle.isEmpty ||
        selectedImage == null ||
        selectedLocation == null) {
      showAboutDialog(
        context: context,
        children: [
          Text(
            'Please enter a title for the place and select an image and location.',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      );
      return;
    }

    ref
        .read(userPlaceProvider.notifier)
        .addPlace(enteredTitle, selectedImage!, selectedLocation!);

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Place')),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleController,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),

              const SizedBox(height: 16),

              ImageInput(
                onSelectedImage: (image) {
                  selectedImage = image;
                },
              ),
              const SizedBox(height: 16),
              LocationInput(
                onSelectLocation: (location) {
                  selectedLocation = location;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: _savePlace,
                label: Text('Add Place'),
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
