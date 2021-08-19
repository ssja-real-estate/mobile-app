import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const valueKey = ValueKey('Login');

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Login'),
      ),
    );
  }
}
