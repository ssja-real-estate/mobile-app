import 'package:flutter/material.dart';
import 'package:saja/home.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple.shade800,
        accentColor: Colors.deepPurpleAccent.shade400,
        brightness: Brightness.light,
        fontFamily: 'IRANSans',
      ),
      home: HomeScreen(),
    );
  }
}
