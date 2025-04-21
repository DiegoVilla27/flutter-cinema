import 'package:flutter/material.dart';

class VideosScreen extends StatelessWidget {
  const VideosScreen({super.key});

  @override
  Widget build(_) {
    return Scaffold(
      appBar: AppBar(title: Text("Videos")),
      body: SafeArea(child: Center(child: Text("Videos Screen"))),
    );
  }
}
