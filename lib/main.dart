import 'package:flutter/material.dart';
import 'package:saja/services/main/main_services.dart';
import 'screens/app.dart';

void main() async {
  await MainServices.initializing();
  runApp(App());
}
