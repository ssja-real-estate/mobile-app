import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/screens/main_app.dart';

import '../resources/fonts.dart';

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
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: ThemeData(
          primaryColor: AppColors.primary(),
          colorScheme: ColorScheme.light(
            primary: AppColors.accent(),
          ),
          brightness: Brightness.light,
          fontFamily: AppFonts.iranSans,
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
