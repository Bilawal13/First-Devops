/// image picker import -> flutter pub add image_picker
/// lets us select images from gallery or camera
/// for IOS add permissions in info.plist
/// use the new widget ImagePicker() to pick images
/// imagePicker.pickImage() returns a XFile which has a path property
/// to display the image we need to convert it to a File using File(pickedImage.path)
/// to display the image we can use Image.file() widget
/// import 'dart:io' to use the File class
/// to store the image we can use a state variable of type File? and update it when we pick an image
/// we can also pass the selected image to a parent widget using a callback function
// /// File? _takenImage;

//   void _takePicture() async {
//      final imagePicker =  ImagePicker();

//      final pickedImage = await imagePicker.pickImage(source: ImageSource.camera , maxWidth: 600);

//       if (pickedImage == null) {
//         return;
//       }
//       // print(pickedImage.path);

//       setState((){
//      _takenImage = File(pickedImage.path);
//       });

// FileImage() is a image provider that can be used to display images from the file system. It takes a File object as a parameter and returns an ImageProvider that can be used with the Image widget to display the image. For example, you can use it like this:
// Location package -> flutter pub add location
/// lets us get the current location of the user  
/// 
/// use Location() to create a location object
/// async the fnc as location fetching is an asynchronous operation
/// check if location services are enabled using location.serviceEnabled() and request to enable if not
/// check for location permissions using location.hasPermission() and request permissions if not granted
/// 
///   void getCurrentUserLocation() async {
    
//     Location location = Location();

// bool serviceEnabled;
// PermissionStatus permissionGranted;
// LocationData locationData;

// serviceEnabled = await location.serviceEnabled();
// if (!serviceEnabled) {
//   serviceEnabled = await location.requestService();
//   if (!serviceEnabled) {
//     return;
//   }
// }

// permissionGranted = await location.hasPermission();
// if (permissionGranted == PermissionStatus.denied) {
//   permissionGranted = await location.requestPermission();
//   if (permissionGranted != PermissionStatus.granted) {
//     return;
//   }
// }

// setState(() {
//   var _isGettingLocation = true;
// });

// locationData = await location.getLocation();

// print('Latitude: ${locationData.latitude}, Longitude: ${locationData.longitude}');
//   }

// GOOGLE MAPS PLATFORM FOR DEVS
// API KEY
// GEOLOCODING API -> convert address to lat and long
// get geolocoding reverse geocoding -> convert lat and long to address
// enter ur api key 
// put these in Uri.parse
// https://maps.googleapis.com/maps/api/geocode/json?latlng=37.7749,-122.4194
// then await http.get(that url) and json.decode 
// then this final address = resData['results'][0]['formatted_address']; for human readable address

// Maps static API -> to display a static map image based on lat and long

// image.network can be used to display an image from the network. It takes a URL as a parameter and returns an Image widget that displays the image from the specified URL. For example, you can use it like this:
// Image.network('https://example.com/image.jpg')

// get google maps flutter pub add google_maps_flutter
// // <meta-data
//             android:name="com.google.android.geo.API_KEY"
//             android:value="AIzaSyCwVhfsHCODIEOP3NtNyAjNo3M3es738eM" />

//             in android manifest to use google maps in android
// minsdk = 20 to use google maps in android

//GoogleMap(initialCameraPosition: CameraPosition(target: LatLng(latitude, longitude), zoom : 16), markers: {Marker(markerId: const MarkerId('m1'), position: LatLng(latitude, longitude))}, )

//GoogleMap(onTap: (position){ -> to get the position where the user tapped on the map and update the state variable to show a marker on that position

//   flutter pub add path_provider -> to get the path to the documents directory where we can store our images permanently
//  flutter pub add path -> to manipulate file paths
// to store the image permanently we can copy the file from the temporary location to the documents directory

// flutter pub add sqflite -> to store data in a local database
// to use sqflite we need to create a database helper class that will handle all the

// can also use shared preferences to store data locally but it is not recommended for storing large data like images or complex data structures

//  final appDir = await syspaths.getApplicationDocumentsDirectory();
//     final fileName = path.basename(image.path);
//     final copiedImage = await image.copy('${appDir.path}/$fileName'); -> to copy the image from the temporary location to the documents directory and get a new file object that points to the copied image which we can then store in our state or database for permanent access 

// final dbPath = await sql.getDatabasesPath();
//     final db = await sql.openDatabase(path.join(dbPath , 'places.db'), onCreate: (db, version) {
//       return db.execute('CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT, loc_lat REAL, loc_lng REAL, address TEXT)');
//     },
//     version: 1);
//     db.insert('user_places',   {
//       'id' : DateTime.now().toString(),
//       'title' : newPlace.title,
//       'image' : copiedImage.path,
//       'loc_lat' : newPlace.location.latitude,
//       'loc_lng' : newPlace.location.longitude,
//       'address' : newPlace.location.address
//     }); -> to create a database and a table to store our places data and insert a new place into the database
    
  // //  final db = await _getDatabase();
  //     final results = await db.query('user_places');
  //     final places =
  //         results
  //             .map(
  //               (row) => PlaceModel(
  //                 id: row['id'] as String,
  //                 title: row['title'] as String,
  //                 image: File(row['image'] as String),
  //                 location: PlaceLocation(
  //                   latitude: row['loc_lat'] as double,
  //                   longitude: row['loc_lng'] as double,
  //                   address: row['address'] as String,
  //                 ),
  //               ),
  //             )
  //             .toList(); -> to fetch the places data from the database and convert it into a list of PlaceModel objects that we can use in our app

// FutureBuilder(
//           future: _placesFuture,
//           builder:
//               (context, snapshot) =>
//                   snapshot.connectionState == ConnectionState.waiting
//                       ? const Center(child: CircularProgressIndicator())
//                       : PlacesList(placesList: userPlaces),
//         ), -> to show a loading spinner while the places data is being fetched from the database and then display the list of places once the data is loaded