import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize local DBs, Hive, etc.
  runApp(const ProviderScope(child: NaturoPathApp()));
}

class NaturoPathApp extends StatelessWidget {
  const NaturoPathApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NaturoPath: 101',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomeScreen(),
    );
  }
}
