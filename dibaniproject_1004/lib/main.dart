import 'package:dibaniproject_1004/login_page.dart';
//import 'package:dibaniproject_1004/registration_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      //home: RegistrationPage(),
      home: LoginPage(),
    );
  }
}