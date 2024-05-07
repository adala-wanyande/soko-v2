import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:soko_v2/screens/profile/set_up_interests.dart';
import 'package:soko_v2/screens/verification/splash_screen.dart';
import 'package:soko_v2/screens/profile/manage_interests.dart';
import 'firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

MaterialColor createMaterialColor(Color color) {
  Map<int, Color> colorMap = {
    50: color.withOpacity(.1),
    100: color.withOpacity(.2),
    200: color.withOpacity(.3),
    300: color.withOpacity(.4),
    400: color.withOpacity(.5),
    500: color.withOpacity(.6),
    600: color.withOpacity(.7),
    700: color.withOpacity(.8),
    800: color.withOpacity(.9),
    900: color.withOpacity(1),
  };
  return MaterialColor(color.value, colorMap);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color primaryColor = const Color(0xFFFF0080);
    return MaterialApp(
      title: 'Soko V2 Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: createMaterialColor(primaryColor),
          backgroundColor: const Color(0xFFF6F5FF),
          accentColor: const Color(0xFF339974),
        ).copyWith(
          secondary: const Color(0xFFF4C3C3),
        ),
        textTheme: TextTheme(
          displayLarge: GoogleFonts.besley(
            fontSize: 48.8,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: GoogleFonts.besley(
            fontSize: 39.04,
            fontWeight: FontWeight.bold,
          ),
          displaySmall: GoogleFonts.besley(
            fontSize: 31.2,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: GoogleFonts.besley(
            fontSize: 24.96,
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: GoogleFonts.besley(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.besley(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: GoogleFonts.robotoSerif(
            fontSize: 24,
          ),
          bodyMedium: GoogleFonts.robotoSerif(
            fontSize: 16, // default body text size
            fontWeight: FontWeight.normal,
          ),
          bodySmall: GoogleFonts.robotoSerif(
            fontSize: 12,
          ),
          labelLarge: GoogleFonts.robotoSerif(
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFFF4C3C3),
        ),
        scaffoldBackgroundColor: const Color(0xFFF6F5FF),
      ),
      home: const SplashScreen(),
    );
  }
}
