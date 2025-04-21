import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(_) {
    return Scaffold(
      appBar: AppBar(title: Text("Videos")),
      body: SafeArea(
        child: Center(
          child: Text("Videos Screen"),
        ),
      ),
    );
  }
}
