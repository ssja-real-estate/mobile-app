import 'package:flutter/material.dart';
import 'package:saja/services/navigation/tab_navigator.dart';
import 'package:saja/widgets/bottom_navigation_bar.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({Key? key}) : super(key: key);

  @override
  _MainAppScreenState createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int _currentTabIndex = 0;

  final _navigatorKeys = {
    0: new GlobalKey<NavigatorState>(),
    1: new GlobalKey<NavigatorState>(),
    2: new GlobalKey<NavigatorState>(),
  };

  void _selectTab(int tabIndex) {
    if (tabIndex == _currentTabIndex) {
      // pop to first route
      _navigatorKeys[tabIndex]!
          .currentState!
          .popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTabIndex = tabIndex);
    }
  }

  void _toggleBottomNavBar(bool boolean) {
    setState(() {});
  }

  Widget _buildOffstageNavigator(int tabIndex) {
    return Offstage(
      offstage: _currentTabIndex != tabIndex,
      child: TabNavigator(
        _navigatorKeys[tabIndex]!,
        tabIndex: tabIndex,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: [
              _buildOffstageNavigator(0),
              _buildOffstageNavigator(1),
              _buildOffstageNavigator(2),
            ],
          ),
        ),
        bottomNavigationBar: AppBottomNavigationBar(
          pageIndex: _currentTabIndex,
          onTap: _selectTab,
        ),
      ),
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTabIndex]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if it's on the main tab, return to main tab
          print('1');
          _toggleBottomNavBar(false);
          if (_currentTabIndex != 0) {
            print('2');

            _selectTab(0);
            return false;
          }
        } else {
          print('3');

          _toggleBottomNavBar(true);
        }
        print('4');

        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
    );
  }
}
