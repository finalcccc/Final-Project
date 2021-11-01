
import 'package:flutter/material.dart';
import 'package:my_authen/home.dart';
import 'package:my_authen/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _route = <String ,WidgetBuilder>{
    '/login' : (context) => Login(),
    '/home': (context)=> Home(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CM Feed Json",
      home: Login(),
    routes: _route,
    );
  }
}
