import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NaturoPath: 101'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Search conditions'),
              onPressed: () {
                // TODO: navigate to search page
              },
            ),
            ElevatedButton(
              child: const Text('My Medicine Cabinet (Premium)'),
              onPressed: () {
                // TODO: show purchase / local-only cabinet
              },
            ),
          ],
        ),
      ),
    );
  }
}
