import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  static const valueKey = ValueKey('LoadingWidget');
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        curve: Curves.bounceOut,
        child: Center(
          child: SpinKitSquareCircle(
            color: Colors.deepPurple.shade800,
            // duration: Duration(milliseconds: 1000),
            size: 50,
          ),
        ),
      ),
    );
  }
}