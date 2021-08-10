import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:penggalangandana/helper/idr_help.dart';
import 'package:penggalangandana/helper/size_help.dart';
import 'package:penggalangandana/model/users/form/form_donsi.dart';

import 'package:penggalangandana/style/color.dart';
import 'package:penggalangandana/style/text_style.dart';

// ignore: must_be_immutable
class Donasi extends StatefulWidget {
  String instansi, img;
  String nama;
  String email;
  String nik;
  var document;
  Donasi(
      {Key key,
      this.instansi,
      @required this.email,
      this.img,
      this.document,
      @required this.nama,
      @required this.nik})
      : super(key: key);

  @override
  _DonasiState createState() => _DonasiState();
}

class _DonasiState extends State<Donasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
          stream: Firestore.instance
              .collection("donasi")
              .where("nama instansi",
                  isEqualTo: widget.instansi == "1"
                      ? "Beasiswa Prestasi Duafa"
                      : widget.instansi == "2"
                          ? "Besiswa Anak Pintar"
                          : "Beasiswa Yatim")
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.data == null) {
              return SizedBox();
            }
            return Padding(
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
                            widget.instansi == "1"
                                ? "Donasi Untuk Perstasi Duafa \n#DompetBerkah"
                                : widget.instansi == "3"
                                    ? "Yok, Berikan reward kepada anak yatim \n#DompetBerkah"
                                    : "Beasiswa Untuk Anak Pintar \n#DompetBerkah",
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text.rich(TextSpan(children: [
                                  TextSpan(
                                    text: "Dana Terkumpul  ",
                                    style: styleBold11,
                                  ),
                                  TextSpan(
                                      text: IDR(snapshot.data.documents.isEmpty
                                          ? 0
                                          : snapshot.data.documents[0]
                                              ['jumlah saldo']),
                                      style: styleGreenNormal),
                                ]))
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 25,
                            right: 70,
                            left: 70,
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
                                              email: widget.email,
                                              nama: widget.nama,
                                              nik: widget.nik,
                                              instansi: widget.instansi,
                                              image: widget.img,
                                              document: widget.document,
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
            );
          }),
    );
  }
}
