import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:penggalangandana/style/color.dart';
import 'package:penggalangandana/style/text_style.dart';

class FormDebit extends StatefulWidget {
  const FormDebit({Key key}) : super(key: key);

  @override
  _FormDebitState createState() => _FormDebitState();
}

class _FormDebitState extends State<FormDebit> {
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
          "Tambah Debit",
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
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: Text(
                        "Pilih BANK",
                        style: styleGreyNormal,
                      ),
                      value: dropdownValue,
                      iconSize: 24,
                      elevation: 16,
                      style: styleNormal,
                      underline: Container(),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>[
                        'BRI',
                        'BNI',
                        'MANDIRI',
                        'BCA',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: styleNormal,
                          ),
                        );
                      }).toList(),
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
                          hintText: "No Rek. xxxxxxxxx",
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none),
                    ),
                  ),
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
                      "Simpan Debit",
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
