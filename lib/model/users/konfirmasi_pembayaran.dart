import 'package:flutter/material.dart';
import 'package:penggalangandana/helper/dialog_help.dart';
import 'package:penggalangandana/helper/idr_help.dart';
import 'package:penggalangandana/model/users/info_donasi_berhasil.dart';
import 'package:penggalangandana/style/color.dart';
import 'package:penggalangandana/style/text_style.dart';

class KonfirmasiPembayaran extends StatelessWidget {
  String img;
  KonfirmasiPembayaran({Key key, @required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Konfimasi Pembayaran"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(
                "Pembayaran BCA Virtual Account",
                style: styleBold,
              ),
            ),
            SizedBox(
              height: 10,
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
                    "Instansi Pembayaran",
                    style: styleBold11,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Transfer sesuai nominal di bawah imi",
                    style: styleNormal11,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    IDR(150248),
                    style: styleBold20,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(20),
                    color: Colors.amber.withOpacity(.3),
                    child: Text.rich(TextSpan(children: [
                      TextSpan(text: "PENTING !", style: styleBold11),
                      TextSpan(
                          text:
                              " Mohon transfer tepat sampai 3 angka terakhir biar kami dapat memproses saldo transaksinya",
                          style: styleGrey11),
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
                          "4988008999",
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
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                      width: 1,
                    )),
                    child: Text.rich(TextSpan(children: [
                      TextSpan(text: "Transfer sebleum", style: styleGrey11),
                      TextSpan(
                          text: " 05 April 2020 00:59 WIB ",
                          style: styleBold11),
                      TextSpan(
                          text:
                              "atau isi saldo kamu automatis dibatalkan oleh sistem",
                          style: styleGrey11),
                    ])),
                  ),
                  FlatButton(
                      onPressed: () {},
                      child: Text(
                        "Batalkan Pembayaean",
                        style: styleGreenNormal,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              width: double.infinity,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: color1,
                onPressed: () {
                  _uploadPhoto(context);
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

  _uploadPhoto(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              padding: EdgeInsets.all(20),
              height: 200,
              child: Column(
                children: [
                  Icon(
                    Icons.camera_alt,
                    size: 50,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    color: color1,
                    onPressed: () {
                      Navigator.pop(context);
                      DIALOG().dialogSukses(
                          context,
                          DonasiBerhasil(
                            img: img,
                          ));
                    },
                    child: Text(
                      "Upload Bukti",
                      style: styleNormalWhite,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
