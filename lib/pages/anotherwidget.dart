import 'package:flutter/material.dart';

class AnotherWidget extends StatelessWidget {
  final Map<String, String?> characters;

  AnotherWidget({required this.characters});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Character 1a: ${characters['character1a'] ?? "N/A"}, Character 2a: ${characters['character2a'] ?? "N/A"}'),
            Text('Character 1b: ${characters['character1b'] ?? "N/A"}, Character 2b: ${characters['character2b'] ?? "N/A"}'),
            Text('Character 1c: ${characters['character1c'] ?? "N/A"}, Character 2c: ${characters['character2c'] ?? "N/A"}'),
          ],
        ),
      ),
    );
  }
}
