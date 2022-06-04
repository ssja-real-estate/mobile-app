import 'package:flutter/material.dart';
import 'package:saja/screens/add_estate/introduction.dart';
import 'package:saja/screens/home.dart';
import 'package:saja/screens/profile/login.dart';
import 'package:saja/screens/profile/user.dart';

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final int tabIndex;

  TabNavigator(this.navigatorKey, {this.tabIndex = 0});

  Map<int, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {

      0: (context) =>  HomeScreen(),
      1: (context) =>  AddEstateIntroductionScreen(),
      2: (context) =>  LoginScreen(),

    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[this.tabIndex]!(context),
        );
      },
    );
  }
}
