import 'package:flutter/material.dart';
import 'package:saja/screens/add_estate.dart';
import 'package:saja/screens/home.dart';
import 'package:saja/screens/login.dart';
import 'package:saja/widgets/loading.dart';

class AppNavigator extends StatefulWidget {
  final int pageIndex;
  const AppNavigator(this.pageIndex, {Key? key}) : super(key: key);

  @override
  _AppNavigatorState createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  bool _loading = false;
  void setLoading(bool boolean) {
    setState(() {
      _loading = boolean;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
      ),
      child: Navigator(
        pages: [
          if (widget.pageIndex == 0)
            MaterialPage(
              child: HomeScreen(),
              key: HomeScreen.valueKey,
            )
          else if (widget.pageIndex == 1)
            MaterialPage(
              child: AddEstateScreen(),
              key: HomeScreen.valueKey,
            )
          else if (widget.pageIndex == 2)
            MaterialPage(
              child: LoginScreen(),
              key: HomeScreen.valueKey,
            ),
          if (_loading)
            MaterialPage(
              child: LoadingWidget(),
              key: LoadingWidget.valueKey,
            )
        ],
        onPopPage: (route, result) {
          return route.didPop(result);
        },
      ),
    );
  }
}
