import 'package:flutter/material.dart';

import '/ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Parallex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'timesBold'),
      home: const HomeScreen(),
    );
  }
}
