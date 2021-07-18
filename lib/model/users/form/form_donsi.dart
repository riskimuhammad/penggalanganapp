import 'package:flutter/material.dart';

import 'package:penggalangandana/helper/dialog_help.dart';
import 'package:penggalangandana/helper/idr_help.dart';
import 'package:penggalangandana/helper/size_help.dart';
import 'package:penggalangandana/style/color.dart';
import 'package:penggalangandana/style/text_style.dart';

// ignore: must_be_immutable
class FormDonasi extends StatefulWidget {
  String instansi;
  String image;

  FormDonasi({Key key, this.instansi, @required this.image}) : super(key: key);

  @override
  _FormDonasiState createState() => _FormDonasiState();
}

class _FormDonasiState extends State<FormDonasi> {
  bool isSwitched = false;
  SingingCharacter _character = SingingCharacter.dompet_saya;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
          child: Container(
            height: SIZE().height(context),
            width: SIZE().widht(context),
            child: Column(
              children: [
                Container(
                  height: 80,
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: colorWhite,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        widget.image,
                        width: 80,
                        height: 80,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.instansi == "1"
                                ? "Baitul Mal"
                                : widget.instansi == "2"
                                    ? "Dompet Dhuafa"
                                    : "Amanah Takaful",
                            style: styleNormal,
                          ),
                          Container(
                            width: 200,
                            child: Text(
                              "Selamatkan nyawa saudara kita #BersamaKitaBisa",
                              style: styleGrey11,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 80,
                  color: colorWhite,
                  padding:
                      EdgeInsets.only(right: 10, top: 10, bottom: 10, left: 80),
                  width: double.infinity,
                  child: Text.rich(TextSpan(children: [
                    TextSpan(text: IDR(342000000), style: styleGreenNormal),
                    TextSpan(
                      text: " Terkumpul ",
                      style: styleBold11,
                    ),
                    TextSpan(
                      text: " Dari\n",
                      style: styleGrey11,
                    ),
                    TextSpan(text: IDR(598000000), style: styleGreyNormal),
                  ])),
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(15),
                  color: colorWhite,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tidak Menampilkan Data Pribadi",
                            style: styleBold,
                          ),
                          Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                                print(isSwitched);
                              });
                            },
                            activeTrackColor: color1,
                            activeColor: Colors.green,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Pilih Metode Pembayaran"),
                          SizedBox(
                            height: 20,
                          ),
                          RadioListTile<SingingCharacter>(
                            contentPadding: EdgeInsets.all(0),
                            activeColor: color1,
                            title: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: colorWhite,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.grey,
                                      style: BorderStyle.solid,
                                      width: 1)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Dompet Saya",
                                      style: styleNormal11,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.payment_rounded,
                                          color: color1,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          IDR(1000000).toString(),
                                          style: styleBold11,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            value: SingingCharacter.dompet_saya,
                            groupValue: _character,
                            onChanged: (SingingCharacter value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RadioListTile<SingingCharacter>(
                            contentPadding: EdgeInsets.all(0),
                            activeColor: color1,
                            title: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: colorWhite,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.grey,
                                      style: BorderStyle.solid,
                                      width: 1)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Kartu Kredit",
                                      style: styleNormal11,
                                    ),
                                    Image.asset(
                                      "assets/images/visa-mastercard.png",
                                      width: 90,
                                      height: 30,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            value: SingingCharacter.kartu_kredit,
                            groupValue: _character,
                            onChanged: (SingingCharacter value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RadioListTile<SingingCharacter>(
                            contentPadding: EdgeInsets.all(0),
                            activeColor: color1,
                            title: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: colorWhite,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.grey,
                                      style: BorderStyle.solid,
                                      width: 1)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Tranfer Bank",
                                      style: styleNormal11,
                                    ),
                                    Image.asset(
                                      "assets/images/bank.png",
                                      width: 120,
                                      height: 50,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            value: SingingCharacter.bank,
                            groupValue: _character,
                            onChanged: (SingingCharacter value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Nominal Donasi",
                                    style: styleNormal,
                                  ),
                                  Text(
                                    IDR(150000).toString(),
                                    style: styleNormal,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Kode Unik",
                                    style: styleNormal,
                                  ),
                                  Text(
                                    "240",
                                    style: styleNormal,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total",
                                    style: styleBold,
                                  ),
                                  Text(
                                    IDR(150240).toString(),
                                    style: styleBold,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 20),
                          width: double.infinity,
                          child: RaisedButton(
                            padding: EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            onPressed: () {
                              DIALOG().dialogSukses(context);
                            },
                            color: color1,
                            child: Text(
                              "Kirim Donasi Sekarang",
                              style: styleNormalWhite,
                            ),
                          ))
                    ],
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum SingingCharacter { dompet_saya, kartu_kredit, bank }
