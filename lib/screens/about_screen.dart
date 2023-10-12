// about_screen.dart

import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
          // child: Text('This is the About Screen'),
          child: ElevatedButton(
        onPressed: () {
          // Navigate back to first route when tapped.
          Navigator.pop(context);
        },
        child: const Text('Go back!'),
      )),
    );
  }
}
