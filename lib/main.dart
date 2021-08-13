import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saja/home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primaryColor: Colors.deepPurple.shade800,
        accentColor: Colors.deepPurpleAccent.shade400,
        brightness: Brightness.light,
        fontFamily: 'IRANSans',
      ),
      home: Navigator(
        pages: [
          MaterialPage(
            key: HomeScreen.valueKey,
            child: HomeScreen(),
          ),
        ],
        onPopPage: (route, result) {
          return route.didPop(result);
        },
      ),
    );
  }
}
