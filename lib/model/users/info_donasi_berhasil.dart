import 'package:flutter/material.dart';
import 'package:penggalangandana/helper/idr_help.dart';
import 'package:penggalangandana/helper/size_help.dart';
import 'package:penggalangandana/layout/users/home_page.dart';
import 'package:penggalangandana/model/users/donasi.dart';
import 'package:penggalangandana/model/users/form/form_donsi.dart';
import 'package:penggalangandana/style/color.dart';
import 'package:penggalangandana/style/text_style.dart';

class DonasiBerhasil extends StatefulWidget {
  String img;
  DonasiBerhasil({Key key, this.img}) : super(key: key);

  @override
  _DonasiBerhasilState createState() => _DonasiBerhasilState();
}

class _DonasiBerhasilState extends State<DonasiBerhasil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        centerTitle: true,
        title: Text("Donasi Selesai"),
      ),
      body: Container(
        width: SIZE().widht(context),
        height: SIZE().height(context),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Terima Kasih !",
              style: styleBold,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Donasi Telah Kami Terima dan akan kamu salurkan",
              style: styleGrey11,
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(left: 15, right: 15, top: 20),
              decoration: BoxDecoration(color: colorWhite, boxShadow: [
                BoxShadow(
                  color: Colors.grey[300],
                  offset: Offset(3, 3),
                  blurRadius: 10,
                  spreadRadius: 1,
                )
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tanggal",
                        style: styleGrey11,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Metode Pembayaran",
                        style: styleGrey11,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "ID Donasi",
                        style: styleGrey11,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Status",
                        style: styleGrey11,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "14 Maret 2020",
                        style: styleGrey11,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Transfer BCA",
                        style: styleGrey11,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "15662544414",
                        style: styleGrey11,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: color1.withOpacity(.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Sukses",
                          style: styleNormalWhite11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 15, right: 15),
              height: 150,
              width: double.infinity,
              color: colorWhite,
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(widget.img),
                    )),
                  ),
                  Expanded(
                      child: Container(
                          child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Selamatkan nyawa saudara kita #BersamaKitaBisa",
                        style: styleNormal11,
                      ),
                      Container(
                        height: 25,
                        margin: EdgeInsets.only(top: 5),
                        child: RaisedButton(
                          padding: EdgeInsets.all(5),
                          color: color1,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FormDonasi(
                                          image: widget.img,
                                        )));
                          },
                          child: Text(
                            "Donasi Lagi",
                            style: styleSize9White,
                          ),
                        ),
                      ),
                    ],
                  ))),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(left: 15, right: 15, top: 20),
              decoration: BoxDecoration(
                color: colorWhite,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Detail Donasi",
                        style: styleGreyNormal,
                      ),
                      Text(
                        IDR(150248),
                        style: styleGreenNormal,
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(top: 10),
                    color: Colors.grey.withOpacity(.1),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Jumlah",
                              style: styleGrey11,
                            ),
                            Text(
                              IDR(150000),
                              style: styleGrey11,
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Kode Unik (*)",
                              style: styleGrey11,
                            ),
                            Text(
                              '248',
                              style: styleGrey11,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              width: double.infinity,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: color1,
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (route) => false);
                },
                child: Text(
                  "Konfirmasi Pembayaran",
                  style: styleNormalWhite,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
