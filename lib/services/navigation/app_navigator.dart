import 'package:flutter/material.dart';

class AppNavigator {
  static Future<T?> pushScreen<T extends Object?>(
      BuildContext context, Widget screen,
      {bool rootNavigator = true}) {
    return Navigator.of(context, rootNavigator: rootNavigator).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return screen;
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          );
        },
        transitionDuration: Duration(milliseconds: 500),
      ),
    );
  }

  static Future<T?> pushAndRemoveUntil<T extends Object?>(BuildContext context,
      Widget screen, bool Function(Route<dynamic>) predicate) {
    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => screen),
      predicate,
    );
  }

  static void popScreen<T extends Object?>(BuildContext context, [T? result]) {
    return Navigator.pop(context, result);
  }
}
