import 'package:flutter/material.dart';
import 'package:penggalangandana/model/admin/donasi_modeling.dart';
import 'package:penggalangandana/model/admin/pay_modeling.dart';
import 'package:penggalangandana/style/color.dart';

class AdminPage extends StatefulWidget {
  AdminPage({Key key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int indexSelected = 0;
  List<Widget> _widget = [
    PayAdminModel(),
    DonasiAdminModel(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexSelected,
          onTap: (value) {
            setState(() {
              indexSelected = value;
            });
          },
          fixedColor: color1,
          items: [
            BottomNavigationBarItem(
              title: Text("Pay"),
              icon: Icon(Icons.payment),
            ),
            BottomNavigationBarItem(
              title: Text("Donasi"),
              icon: Icon(Icons.card_giftcard),
            )
          ]),
      body: _widget.elementAt(indexSelected),
    );
  }
}
