import 'package:bookly/account_credentials/login_setup.dart';
import 'package:bookly/firebase_options.dart';
import 'package:bookly/screens/tabScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

// 1. Define the High-Contrast ColorScheme
final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color(0xFFFFD700), // Electric Yellow
  primary: const Color(0xFFFFD700),
  onPrimary: const Color(0xFF000000), // Black text on yellow buttons
  surface: const Color(0xFF121212), // Deep Matte Black
  onSurface: Colors.white, // White text for readability
  secondary: const Color(0xFF1E1E1E), // Slightly lighter black for cards
);

// 2. Build the Bookly Theme
final booklyTheme = ThemeData().copyWith(
  scaffoldBackgroundColor: const Color(0xFF000000), // Pure Black background
  colorScheme: colorScheme,

  // Customizing Typography to Ubuntu Condensed
  textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
    titleSmall: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleMedium: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
      color: const Color(0xFFFFD700), // Yellow for mid-titles
    ),
    titleLarge: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      color: Colors.white,
    ),
  ),

  // Specific UI Component Styling
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF121212),
    foregroundColor: Color(0xFFFFD700), // Yellow icons/text
    elevation: 0,
  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF121212),
    selectedItemColor: Color(0xFFFFD700),
    unselectedItemColor: Colors.grey,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFFFD700),
      foregroundColor: const Color(0xFF000000),
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
    ),
  ),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bookly',
      theme: booklyTheme,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Tabscreen();
          } else {
            return LoginSetup();
          }
        },
      ),
    );
  }
}
