import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/screens/main_app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: ThemeData(
          primaryColor: AppColors.primary(),
          colorScheme: ColorScheme.light(
            primary: AppColors.accent(),
          ),
          brightness: Brightness.light,
          fontFamily: 'IRANSans',
        ),
        home: SafeArea(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: MainAppScreen(),
          ),
        ),
      ),
    );
  }
}
