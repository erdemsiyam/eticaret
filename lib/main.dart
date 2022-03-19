import 'package:eticaret/page/login_page.dart';
import 'package:eticaret/page/main_page.dart';
import 'package:eticaret/page/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(
        title: "bbb",
      ),
    );
  }
}
