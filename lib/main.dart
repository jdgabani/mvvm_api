import 'package:flutter/material.dart';
import 'package:mvvm_api/View/HomeScreen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mvvm Api',
      home: HomeScreen(),
    );
  }
}
