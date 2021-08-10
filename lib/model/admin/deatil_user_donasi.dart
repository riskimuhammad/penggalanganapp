import 'package:flutter/material.dart';
import 'package:penggalangandana/helper/idr_help.dart';
import 'package:penggalangandana/style/color.dart';
import 'package:penggalangandana/style/text_style.dart';

class DetailUserDonasi extends StatelessWidget {
  String nama;
  String donasi;
  String image;
  String rek;
  DetailUserDonasi(
      {Key key, this.donasi, this.image, this.nama, @required this.rek})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                color: colorWhite,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: color1,
                    child: Icon(
                      Icons.person,
                      color: colorWhite,
                    ),
                  ),
                  title: Text(
                    nama,
                    style: styleNormal11,
                  ),
                  subtitle: Text(
                    "Donasi " + IDR(int.parse(donasi) + 248).toString(),
                    style: styleGreenNormal11,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                padding: EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: colorWhite,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.4),
                        blurRadius: 10,
                        offset: Offset(3, 3),
                        spreadRadius: 1,
                      )
                    ]),
                child: Column(
                  children: [
                    Text(
                      "Detail Donasi User",
                      style: styleBold11,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Jumlah yang di transfer user",
                      style: styleNormal11,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      IDR(int.parse(donasi) + 248).toString(),
                      style: styleBold20,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(20),
                      color: color1.withOpacity(.3),
                      child: Text.rich(TextSpan(children: [
                        TextSpan(
                            text: "TIDAK TERKONFIRMASI !\n",
                            style: styleBold11),
                        TextSpan(
                          text:
                              " Tolong di konfirmasi segera secara manual, cek saldo Banking anda",
                          style: styleNormalWhite11,
                        ),
                      ])),
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
                                IDR(int.parse(donasi)).toString(),
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
                    Text(
                      "Pembayaran dilakukan ke rekening a/n",
                      style: styleGrey11,
                    ),
                    Text(
                      "Yayasn BantuUmat",
                      style: styleBold11,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(10),
                      color: Colors.grey.withOpacity(.1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/images/bca.png",
                            width: 60,
                            height: 40,
                          ),
                          Text(
                            rek,
                            style: styleBold11,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Text(
                              "SALIN",
                              style: styleGreenNormal11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
