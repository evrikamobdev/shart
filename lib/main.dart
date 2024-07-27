import 'package:flutter/material.dart';
import 'package:shart/home_screen.dart';
import 'package:shart/screens/auth/login_screen.dart';
import 'package:shart/styling/shart_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
      title: '',
      theme: shartTheme,
    );
  }
}
