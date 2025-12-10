import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NaturoPath: 101',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8B5E3C), // earth-tone seed color
          brightness: Brightness.light,
        ),

        // AppBar theme (global) — darker green
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF145A32), // dark herb green
          foregroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),

        // Keep the main body a soft beige
        scaffoldBackgroundColor: const Color(0xFFFBF6F4),

        // FAB (earth-tone brown)
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF6B4F3B),
          foregroundColor: Colors.white,
          elevation: 6,
        ),
      ),
      home: const MyHomePage(title: 'NaturoPath: 101'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to scale the title if you want (example below) - this is optional.
    final titleFontSize = MediaQuery.of(context).size.width * 0.05; // responsive

    return Scaffold(
      appBar: AppBar(
        // No backgroundColor here — the appBarTheme provides it app-wide
        centerTitle: false,
        title: Text(
          widget.title,
          style: TextStyle(
            // We override just the size here to scale the title; color/weight come from theme
            fontSize: titleFontSize,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: const TextStyle(fontSize: 36),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _counter++;
        }),
        child: const Icon(Icons.add),
      ),
    );
  }
}