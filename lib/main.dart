import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saja/home.dart';
import 'package:saja/loading.dart';

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
  bool _loading = false;

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
        child: Navigator(
          pages: [
            MaterialPage(
              key: HomeScreen.valueKey,
              child: HomeScreen(setLoading),
            ),
            if (_loading)
              MaterialPage(
                child: LoadingWidget(),
                key: LoadingWidget.valueKey,
              ),
          ],
          onPopPage: (route, result) {
            return route.didPop(result);
          },
        ),
      ),
    );
  }

  void setLoading(bool boolean) {
    setState(() {
      _loading = boolean;
    });
  }
}
