import 'package:flutter/material.dart';
import 'package:penggalangandana/helper/idr_help.dart';
import 'package:penggalangandana/helper/size_help.dart';
import 'package:penggalangandana/model/users/form/form_donsi.dart';

import 'package:penggalangandana/style/color.dart';
import 'package:penggalangandana/style/text_style.dart';

// ignore: must_be_immutable
class Donasi extends StatefulWidget {
  String instansi, img;
  Donasi({Key key, this.instansi, this.img}) : super(key: key);

  @override
  _DonasiState createState() => _DonasiState();
}

class _DonasiState extends State<Donasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
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
                            child: Text(
                      "Selamatkan nyawa saudara kita #BersamaKitaBisa",
                      style: styleNormal,
                    )))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 200,
                width: SIZE().widht(context),
                child: Stack(
                  children: [
                    Container(
                      height: 150,
                      padding: EdgeInsets.all(20),
                      width: SIZE().widht(context),
                      color: colorWhite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(TextSpan(children: [
                            TextSpan(
                              text: "Dana yang dibutuhkan ",
                              style: styleBold11,
                            ),
                            TextSpan(text: IDR(598000000))
                          ])),
                          SizedBox(
                            height: 10,
                          ),
                          Text.rich(TextSpan(children: [
                            TextSpan(
                                text: IDR(342000000), style: styleGreenNormal),
                            TextSpan(
                              text: " Terkumpul ",
                              style: styleBold11,
                            ),
                            TextSpan(
                              text: " Dari\n",
                              style: styleGrey11,
                            ),
                            TextSpan(
                                text: IDR(598000000), style: styleGreyNormal),
                          ]))
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 25,
                      right: 100,
                      left: 100,
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        color: color2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FormDonasi(
                                        instansi: widget.instansi,
                                        image: widget.img,
                                      )));
                        },
                        child: Text(
                          "Donasi Sekarang",
                          style: styleNormalWhite11,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 250,
                width: double.infinity,
                color: colorWhite,
                child: Stack(
                  children: [
                    Positioned(
                      top: 40,
                      left: 20,
                      right: 20,
                      bottom: 20,
                      child: SingleChildScrollView(
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 5,
                      left: 20,
                      right: 20,
                      child: Container(
                        height: 30,
                        width: 200,
                        decoration: BoxDecoration(
                            color: color2,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            "Deskripsi Donasi",
                            style: styleNormalWhite,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
