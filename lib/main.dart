import 'package:flutter/material.dart';
import 'package:penggalangandana/layout/users/home_page.dart';
import 'package:penggalangandana/style/color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(appBarTheme: AppBarTheme(color: color2)),
      home: HomePage(),
    );
  }
}
