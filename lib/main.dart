import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:penggalangandana/layout/admin/admin_page.dart';
import 'package:penggalangandana/layout/users/home_page.dart';
import 'package:penggalangandana/style/color.dart';
import 'package:penggalangandana/style/text_style.dart';

import 'layout/login_page.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme:
              AppBarTheme(color: color1, titleTextStyle: styleSize9White)),
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
            if (snapshot.data == null) {
              return Login();
            }
            if (snapshot.data.email == "admin@gmail.com") {
              return AdminPage();
            } else {
              return HomePage(
                email: snapshot.data.email,
              );
            }
          }),
    );
  }
}
