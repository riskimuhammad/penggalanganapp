import 'package:flutter/material.dart';

import 'package:penggalangandana/database/penggalangan_app_base.dart';
import 'package:penggalangandana/helper/dialog_help.dart';
import 'package:penggalangandana/style/color.dart';
import 'package:penggalangandana/style/text_style.dart';

class FormCreditCard extends StatefulWidget {
  var document;
  FormCreditCard({Key key, this.document}) : super(key: key);

  @override
  _FormCreditCardState createState() => _FormCreditCardState();
}

class _FormCreditCardState extends State<FormCreditCard> {
  String dropdownValue;
  TextEditingController _namaController;
  TextEditingController nomorRekcontroller;
  TextEditingController _mmThController;
  TextEditingController _cvvController;
  @override
  void initState() {
    _namaController = TextEditingController(text: "");
    nomorRekcontroller = TextEditingController(text: "");
    _mmThController = TextEditingController(text: "");
    _cvvController = TextEditingController(text: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          "Tambah Kartu Credit",
          style: styleBold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, right: 15, left: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                  child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.only(
                      left: 15,
                      right: 15,
                      bottom: 5,
                    ),
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: color1))),
                    child: TextFormField(
                      controller: _namaController,
                      decoration: InputDecoration(
                          fillColor: color1,
                          focusColor: color1,
                          hoverColor: color1,
                          hintText: "Nama Pengguna",
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.only(
                      left: 15,
                      right: 15,
                      bottom: 5,
                    ),
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: color1))),
                    child: TextFormField(
                      controller: nomorRekcontroller,
                      decoration: InputDecoration(
                          fillColor: color1,
                          focusColor: color1,
                          hoverColor: color1,
                          hintText: "No Rek. xxxx xxxx xxxx xxxx",
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          padding: EdgeInsets.only(
                            left: 15,
                            right: 15,
                            bottom: 5,
                          ),
                          decoration: BoxDecoration(
                              border:
                                  Border(bottom: BorderSide(color: color1))),
                          child: TextFormField(
                            controller: _mmThController,
                            decoration: InputDecoration(
                                fillColor: color1,
                                focusColor: color1,
                                hoverColor: color1,
                                hintText: "MM/TH",
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          padding: EdgeInsets.only(
                            left: 15,
                            right: 15,
                            bottom: 5,
                          ),
                          decoration: BoxDecoration(
                              border:
                                  Border(bottom: BorderSide(color: color1))),
                          child: TextFormField(
                            controller: _cvvController,
                            decoration: InputDecoration(
                                fillColor: color1,
                                focusColor: color1,
                                hoverColor: color1,
                                hintText: "CVV",
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )),
              Container(
                  margin: EdgeInsets.only(top: 40),
                  width: double.infinity,
                  child: RaisedButton(
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () {
                      DIALOG().dialogInfo(context);
                      ServiceApp().addCreditCard(
                          _namaController.text,
                          nomorRekcontroller.text,
                          _mmThController.text,
                          _cvvController.text,
                          widget.document);
                    },
                    color: color1,
                    child: Text(
                      "Simpan Credit",
                      style: styleNormalWhite,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
