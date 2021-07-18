import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:penggalangandana/helper/idr_help.dart';
import 'package:penggalangandana/helper/size_help.dart';
import 'package:penggalangandana/model/users/form/form_tambah_debit.dart';
import 'package:penggalangandana/model/users/form/form_tambah_kredit.dart';
import 'package:penggalangandana/style/color.dart';
import 'package:penggalangandana/style/text_style.dart';

class Profile extends StatefulWidget {
  String img;
  Profile({Key key, @required this.img}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: styleBold,
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: color1.withOpacity(.2),
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  trailing: Icon(
                    Icons.edit,
                    color: Colors.grey,
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/person.jpeg"),
                  ),
                  title: Text(
                    "Muhammad Riski",
                    style: styleBold,
                  ),
                  subtitle: Text(
                    "ID : 1111782877819",
                    style: styleSize11,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  RaisedButton(
                    color: colorWhite,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FormCreditCard()));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Tambah Kredit",
                          style: styleBold11,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          "assets/images/visa-mastercard.png",
                          width: 50,
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  RaisedButton(
                    color: colorWhite,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FormDebit()));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Tambah Debit ",
                          style: styleBold11,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          "assets/images/bank.png",
                          width: 74,
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Riwayat Donasi",
                style: styleBold,
              ),
              Column(
                children: [
                  ListTile(
                    trailing: Image.asset(widget.img),
                    title: Text("Baitul Mal"),
                    subtitle: Text("Jumlah Donasi : " + IDR(150040).toString()),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
