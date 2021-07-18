import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:penggalangandana/style/color.dart';
import 'package:penggalangandana/style/text_style.dart';

class FormCreditCard extends StatefulWidget {
  const FormCreditCard({Key key}) : super(key: key);

  @override
  _FormCreditCardState createState() => _FormCreditCardState();
}

class _FormCreditCardState extends State<FormCreditCard> {
  String dropdownValue;
  TextEditingController _namaController;
  @override
  void initState() {
    _namaController = TextEditingController(text: "");
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
                      controller: _namaController,
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
                            controller: _namaController,
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
                            controller: _namaController,
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
                    onPressed: () {},
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
