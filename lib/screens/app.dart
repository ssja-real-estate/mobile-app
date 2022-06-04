import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/routes.dart';
import 'package:saja/resources/screen_indexes.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/screens/add_estate/estate_delegation_type.dart';
import 'package:saja/screens/add_estate/province_city.dart';
import 'package:saja/screens/main_app.dart';
import 'package:saja/screens/profile/change_pass.dart';
import 'package:saja/screens/profile/forget.dart';
import 'package:saja/screens/profile/signup.dart';
import 'package:saja/services/size/size_config.dart';

import '../resources/fonts.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}


class _AppState extends State<App> {

  @override
  Widget build(BuildContext context){
    return GestureDetector(

      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: GetMaterialApp(
        getPages: Routs.getPages,
        
        initialRoute: "/",
        // routes: Routs.routes,
        textDirection: TextDirection.rtl,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: ThemeData(
          primaryColor: AppColors.primary(),
          colorScheme: ColorScheme.light(
            primary: AppColors.accent(),

          ),
          brightness:Brightness.light,
          fontFamily:AppFonts.iranSans,
        ),

        // home: SafeArea(
        //   child: MainAppScreen(),
        // ),

      ),
    );
  }
}
