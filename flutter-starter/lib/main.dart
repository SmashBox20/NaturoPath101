import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'services/medicine_cabinet_service.dart';

void main() {
  runApp(const NaturoPathApp());
}

class NaturoPathApp extends StatelessWidget {
  const NaturoPathApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MedicineCabinetService()),
      ],
      child: MaterialApp(
        title: 'NaturoPath:101',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF2D5F3F), // Forest Green
            primary: const Color(0xFF2D5F3F),
            secondary: const Color(0xFF8FAF9B), // Sage Green
            surface: const Color(0xFFF5F1E8), // Cream
          ),
          scaffoldBackgroundColor: const Color(0xFFF5F1E8),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF2D5F3F),
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          cardTheme: CardTheme(
            color: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF2D5F3F), width: 2),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2D5F3F),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C2C2C),
            ),
            displayMedium: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C2C2C),
            ),
            displaySmall: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2C2C2C),
            ),
            bodyLarge: TextStyle(
              fontSize: 16,
              color: Color(0xFF2C2C2C),
            ),
            bodyMedium: TextStyle(
              fontSize: 14,
              color: Color(0xFF666666),
            ),
            bodySmall: TextStyle(
              fontSize: 12,
              color: Color(0xFF999999),
            ),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
