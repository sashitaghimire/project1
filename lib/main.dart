import 'package:flutter/material.dart';
import'./ui/pages/ListViews.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home:ListViews(),
    );
  }
}


