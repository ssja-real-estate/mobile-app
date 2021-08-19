import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saja/services/navigation/app_navigator.dart';
import 'package:saja/widgets/bottom_navigation_bar.dart';

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

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _pageIndex = 0;

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
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: AppNavigator(_pageIndex),
          bottomNavigationBar: AppBottomNavigationBar(
            pageIndex: _pageIndex,
            onTap: (index) {
              setState(() {
                _pageIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
