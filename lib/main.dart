import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weathertime/home.dart';

void main() {
  runApp(const ClemyApp());
}

class ClemyApp extends StatefulWidget {
  const ClemyApp({Key? key}) : super(key: key);

  @override
  State<ClemyApp> createState() => _ClemyAppState();
}

class _ClemyAppState extends State<ClemyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
