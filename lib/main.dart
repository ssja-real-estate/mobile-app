import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saja/services/navigation/app_navigator.dart';

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
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  bool _loggedIn = false;

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
          bottomNavigationBar: CurvedNavigationBar(
            index: _pageIndex,
            key: _bottomNavigationKey,
            items: [
              Icon(
                Icons.home_rounded,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.add_circle_rounded,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                _loggedIn ? Icons.dashboard : Icons.person_rounded,
                size: 30,
                color: Colors.white,
              ),
            ],
            animationDuration: Duration(milliseconds: 300),
            height: 50,
            backgroundColor: Colors.white,
            color: Colors.deepPurple.shade800,
            buttonBackgroundColor: Colors.deepPurple.shade800,
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
