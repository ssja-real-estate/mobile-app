import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatefulWidget {
  final pageIndex;
  final ValueChanged<int>? onTap;
  const AppBottomNavigationBar({this.pageIndex, this.onTap, Key? key})
      : super(key: key);

  @override
  _AppBottomNavigationBarState createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  bool _loggedIn = false;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: widget.pageIndex,
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
      onTap: widget.onTap,
    );
  }
}
