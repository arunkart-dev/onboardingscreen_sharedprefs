import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Home'),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text('Welcome to app'),
      ),
    );
  }
}