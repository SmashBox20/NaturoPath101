import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const NaturoPathApp());
}

class NaturoPathApp extends StatelessWidget {
  const NaturoPathApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Add providers here as needed
        // ChangeNotifierProvider(create: (_) => ContentProvider()),
        // ChangeNotifierProvider(create: (_) => MedicineCabinetProvider()),
      ],
      child: MaterialApp(
        title: 'NaturoPath: 101',
        theme: ThemeData(
          // Primary color - natural green
          primarySwatch: MaterialColor(
            0xFF2D7A3E,
            const <int, Color>{
              50: Color(0xFFE6F2E9),
              100: Color(0xFFC0DFC8),
              200: Color(0xFF96CAA3),
              300: Color(0xFF6CB57E),
              400: Color(0xFF4DA562),
              500: Color(0xFF2D7A3E),
              600: Color(0xFF287238),
              700: Color(0xFF226730),
              800: Color(0xFF1C5D28),
              900: Color(0xFF114A1B),
            },
          ),
          primaryColor: const Color(0xFF2D7A3E),
          
          // Accent color - gold
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF2D7A3E),
            secondary: const Color(0xFFD4A855),
          ),
          
          // Background colors
          scaffoldBackgroundColor: const Color(0xFFFAFAF8),
          
          // Typography
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3E50),
            ),
            displayMedium: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3E50),
            ),
            displaySmall: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2C3E50),
            ),
            bodyLarge: TextStyle(
              fontSize: 16,
              color: Color(0xFF2C3E50),
            ),
            bodyMedium: TextStyle(
              fontSize: 14,
              color: Color(0xFF7F8C8D),
            ),
          ),
          
          // App Bar theme
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF2D7A3E),
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          
          // Card theme
          cardTheme: CardTheme(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          
          // Button themes
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2D7A3E),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          
          useMaterial3: true,
        ),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
