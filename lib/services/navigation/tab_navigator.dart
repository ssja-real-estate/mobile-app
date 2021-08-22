import 'package:flutter/material.dart';
import 'package:saja/screens/add_estate.dart';
import 'package:saja/screens/home.dart';
import 'package:saja/screens/login.dart';

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final int tabIndex;

  TabNavigator(this.navigatorKey, {this.tabIndex = 0});

  Map<int, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      0: (context) => new HomeScreen(),
      1: (context) => new AddEstateScreen(),
      2: (context) => new LoginScreen(),
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
