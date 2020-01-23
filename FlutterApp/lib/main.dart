import 'package:flutter_app/Listings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Listings(),
    );
  }
}
