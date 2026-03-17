//Authentication from firebase can help with google facebook and twitter sign in
//but we will use email and password for this app

// firebase auth api is used to create a new user with email and password and to sign in an existing user with email and password
// add sdk by installing firebase cli 
// cli is a command line tool that allows you to interact with firebase services from the command line like sdk

// to install firebase cli run the following command in terminal
// npm install -g firebase-tools
// flutterfire configure -> to configure firebase for your flutter app and it will generate a file called firebase_options.dart in the lib folder
// flutter pub add firebase_core -> to add firebase core package to your flutter app and it is required to initialize firebase in your app
// flutter pub add firebase_auth -> to add firebase auth package to your flutter app and it is required to use firebase authentication in your app
// configure again



//main--

// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

// WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform); -> in main function to initialize firebase before running the app

// _auth.signInWithEmailAndPassword
// _auth.createUserWithEmailAndPassword

//  FirebaseAuthException catch (error) {
//       if (error.code == 'email-already-in-use')


// StreamBuilder(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return const Chat();
//           } else {
//             return const AuthScreen();
//           }
//         },
//       ),

// flutter pub add firebase_storage 

// cloud firestore --> flutter pub add cloud_firestore

//FirebaseFirestore.instance.collection('users').doc(userCredentials.user!.uid).set({
        //   'email': _enteredEmail,
        //   'image_url': imageUrl,
        // }); 
        // firestore works with collections and documents and it is a NoSQL database and it is used to store data in the form of documents and collections and it is used to store data in the cloud and it is used to sync data in real time across all clients and it is used to store data in a structured way and it is used to query data in a powerful way and it is used to store data in a scalable way and it is used to store data in a secure way and it is used to store data in a flexible way and it is used to store data in a cost effective way

        //FocusScope.of(context).unfocus(); called to hide the keyboard after sending the message and to remove the focus from the text field after sending the message

        //flutter pub add firebase_messaging -> to add firebase messaging package to your flutter app and it is required to use firebase cloud messaging in your app