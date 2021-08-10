import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:penggalangandana/helper/idr_help.dart';
import 'package:penggalangandana/helper/size_help.dart';

import 'package:penggalangandana/model/users/konfirmasi_pembayaran.dart';
import 'package:penggalangandana/style/color.dart';
import 'package:penggalangandana/style/text_style.dart';

// ignore: must_be_immutable
class FormDonasi extends StatefulWidget {
  String instansi;
  String image;
  String nik;
  String nama;
  String email;
  var document;
  FormDonasi(
      {Key key,
      this.instansi,
      this.image,
      this.document,
      @required this.email,
      @required this.nama,
      @required this.nik})
      : super(key: key);

  @override
  _FormDonasiState createState() => _FormDonasiState();
}

class _FormDonasiState extends State<FormDonasi> {
  TextEditingController controller = TextEditingController(text: "");
  bool isSwitched = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SingingCharacter _character;
  GlobalKey<ScaffoldState> scffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scffoldKey,
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
              padding: const EdgeInsets.only(
                  top: 20, left: 15, right: 15, bottom: 20),
              child: Container(
                height: SIZE().height(context) - 100,
                width: SIZE().widht(context),
                child: SingleChildScrollView(
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
                                      ? "Beasiswa Prestasi Duafa"
                                      : widget.instansi == "2"
                                          ? "Besiswa Anak Pintar"
                                          : "Beasiswa Yatim",
                                  style: styleNormal,
                                ),
                                Container(
                                  width: 200,
                                  child: Text(
                                    widget.instansi == "1"
                                        ? "Beasiswa Untuk Perstasi Duafa"
                                        : widget.instansi == "3"
                                            ? "Beasiswa yatim"
                                            : "Beasiswa Untuk Anak Pintar",
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
                        padding: EdgeInsets.only(
                            right: 10, top: 10, bottom: 10, left: 80),
                        width: double.infinity,
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                            text: "Dana Terkumpul  ",
                            style: styleBold11,
                          ),
                          TextSpan(
                              text: IDR(snapshot.data.documents.isEmpty
                                  ? 0
                                  : snapshot.data.documents[0]['jumlah saldo']),
                              style: styleGreenNormal),
                        ])),
                      ),
                      Container(
                        height: 100,
                        width: double.infinity,
                        color: colorWhite,
                        margin: EdgeInsets.only(top: 20),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _textFormField("Jumlah Donasi", controller)
                            ],
                          ),
                        ),
                      ),
                      Container(
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
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
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
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
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
                                    if (controller.text.isEmpty) {
                                      formKey.currentState.validate();
                                    } else {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  KonfirmasiPembayaran(
                                                    jenisRek: _character ==
                                                            SingingCharacter
                                                                .kartu_kredit
                                                        ? "kredit"
                                                        : "debit",
                                                    debit: "8766766662",
                                                    norek: "2662555422",
                                                    instansi: widget.instansi ==
                                                            "1"
                                                        ? "Beasiswa Prestasi Duafa"
                                                        : widget.instansi == "2"
                                                            ? "Besiswa Anak Pintar"
                                                            : "Beasiswa Yatim",
                                                    email: widget.email,
                                                    jenis: widget.instansi ==
                                                            "1"
                                                        ? "Beasiswa Prestasi Duafa"
                                                        : widget.instansi == "2"
                                                            ? "Besiswa Anak Pintar"
                                                            : "Beasiswa Yatim",
                                                    nama: isSwitched == true
                                                        ? "Tidak ada nama"
                                                        : widget.nama,
                                                    nik: widget.nik,
                                                    jumlah: controller.text,
                                                    document: widget.document,
                                                    img: widget.image,
                                                    typePembayaran:
                                                        _character ==
                                                                SingingCharacter
                                                                    .bank
                                                            ? "Bank"
                                                            : "Credit",
                                                  )));
                                    }
                                  },
                                  color: color1,
                                  child: Text(
                                    "Kirim Donasi Sekarang",
                                    style: styleNormalWhite,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget _textFormField(String hinText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: TextFormField(
        keyboardType: TextInputType.number,
        validator: (validasi) {
          if (validasi == null || validasi.isEmpty)
            return "Jumlah donasi wajib di isi";
          else if (controller.text.contains(RegExp('[A-Z]')) ||
              controller.text.contains(RegExp('[a-z]'))) {
            return "Hanya number";
          } else {
            return "";
          }
        },
        controller: controller,
        obscureText: hinText == 'Password' ? true : false,
        decoration: InputDecoration(hintText: hinText),
      ),
    );
  }
}

enum SingingCharacter { kartu_kredit, bank }
