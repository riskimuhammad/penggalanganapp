import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormDonasi extends StatefulWidget {
  String instansi;
  FormDonasi({Key key, this.instansi}) : super(key: key);

  @override
  _FormDonasiState createState() => _FormDonasiState();
}

class _FormDonasiState extends State<FormDonasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [],
      ),
    );
  }
}
