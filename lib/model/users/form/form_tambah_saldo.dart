import 'package:flutter/material.dart';
import 'package:penggalangandana/helper/dialog_help.dart';
import 'package:penggalangandana/helper/idr_help.dart';
import 'package:penggalangandana/helper/size_help.dart';
import 'package:penggalangandana/style/color.dart';
import 'package:penggalangandana/style/text_style.dart';

class TambahSaldo extends StatefulWidget {
  TambahSaldo({Key key}) : super(key: key);

  @override
  _TambahSaldoState createState() => _TambahSaldoState();
}

class _TambahSaldoState extends State<TambahSaldo> {
  TextEditingController _saldoController;
  @override
  void initState() {
    _saldoController = TextEditingController(text: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Form(
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
                    controller: _saldoController,
                    decoration: InputDecoration(
                        fillColor: color1,
                        focusColor: color1,
                        hoverColor: color1,
                        hintText: "Jumlah saldo",
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none),
                  ),
                ),
              ],
            )),
          ),
          Container(
              margin: EdgeInsets.only(top: 40, left: 15, right: 15, bottom: 20),
              width: double.infinity,
              child: RaisedButton(
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () {
                  DIALOG().dialogSuksesSimpan(context);
                },
                color: color1,
                child: Text(
                  "Top-Up Saldo",
                  style: styleNormalWhite,
                ),
              )),
          Container(
            height: 300,
            width: SIZE().widht(context),
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _saldoController.text = IDR(50000).toString();
                            });
                          },
                          child: Container(
                            height: 200,
                            padding: EdgeInsets.all(20),
                            decoration:
                                BoxDecoration(color: colorWhite, boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[300],
                                  offset: Offset(
                                    3,
                                    3,
                                  ),
                                  blurRadius: 10,
                                  spreadRadius: 1)
                            ]),
                            child: Center(
                              child: Text(
                                IDR(50000),
                                style: styleBold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _saldoController.text = IDR(100000).toString();
                            });
                          },
                          child: Container(
                            height: 200,
                            decoration:
                                BoxDecoration(color: colorWhite, boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[300],
                                  offset: Offset(
                                    3,
                                    3,
                                  ),
                                  blurRadius: 10,
                                  spreadRadius: 1)
                            ]),
                            child: Center(
                              child: Text(
                                IDR(100000),
                                style: styleBold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _saldoController.text = IDR(150000).toString();
                            });
                          },
                          child: Container(
                            height: 200,
                            decoration:
                                BoxDecoration(color: colorWhite, boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[300],
                                  offset: Offset(
                                    3,
                                    3,
                                  ),
                                  blurRadius: 10,
                                  spreadRadius: 1)
                            ]),
                            child: Center(
                              child: Text(
                                IDR(150000),
                                style: styleBold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _saldoController.text = IDR(200000).toString();
                            });
                          },
                          child: Container(
                            height: 200,
                            decoration:
                                BoxDecoration(color: colorWhite, boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[300],
                                  offset: Offset(
                                    3,
                                    3,
                                  ),
                                  blurRadius: 10,
                                  spreadRadius: 1)
                            ]),
                            child: Center(
                              child: Text(
                                IDR(200000),
                                style: styleBold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
