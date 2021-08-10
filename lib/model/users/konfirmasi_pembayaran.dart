import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:penggalangandana/database/penggalangan_app_base.dart';
import 'package:penggalangandana/helper/dialog_help.dart';
import 'package:penggalangandana/helper/idr_help.dart';
import 'package:penggalangandana/layout/users/home_page.dart';
import 'package:penggalangandana/model/users/info_donasi_berhasil.dart';
import 'package:penggalangandana/style/color.dart';
import 'package:penggalangandana/style/text_style.dart';
import 'package:path/path.dart';

class KonfirmasiPembayaran extends StatefulWidget {
  String img;
  var document;
  String typePembayaran;
  String jumlah;
  String nama;
  String nik;
  String type;
  String jenis;
  String email;
  String instansi;
  String debit;
  String norek;
  String jenisRek;

  KonfirmasiPembayaran(
      {Key key,
      @required this.debit,
      @required this.jenisRek,
      @required this.norek,
      @required this.instansi,
      this.img,
      this.document,
      this.typePembayaran,
      this.jumlah,
      this.jenis,
      this.nama,
      this.nik,
      this.type,
      @required this.email})
      : super(key: key);

  @override
  _KonfirmasiPembayaranState createState() => _KonfirmasiPembayaranState();
}

class _KonfirmasiPembayaranState extends State<KonfirmasiPembayaran> {
  File img;
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
  Future getImage() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      img = tempImage;
    });
  }

  var total;

  String filename;
  String photoUrl = "";

  Future uploadPic(BuildContext context) async {
    filename = basename(img.path);
    StorageReference firebaseStorage =
        FirebaseStorage.instance.ref().child("/produk");

    StorageUploadTask task = firebaseStorage.child(filename).putFile(img);
    StorageTaskSnapshot snapshot = await task.onComplete;
    String downUrl = await (await task.onComplete).ref.getDownloadURL();

    print("photoUrl : " + downUrl);
    setState(() {
      photoUrl = downUrl;
      print("download Url" + photoUrl);
      print("Profile Picture Uploaded");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      appBar: AppBar(
        title: Text("Konfimasi Pembayaran"),
      ),
      body: StreamBuilder(
          stream: Firestore.instance
              .collection("donasi")
              .where("nama instansi", isEqualTo: widget.instansi)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.data == null) {
              return SizedBox();
            }
            return StreamBuilder(
                stream: Firestore.instance
                    .collection("users")
                    .document(widget.document)
                    .collection(
                        widget.jenisRek == "kredit" ? "kredit user" : "debit")
                    .snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> historySnapshot) {
                  if (historySnapshot.data == null) {
                    return SizedBox();
                  }
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            "Pembayaran Virtual Account",
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
                                "Transfer sesuai nominal di bawah ini",
                                style: styleNormal11,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                IDR(int.parse(widget.jumlah) + 248),
                                style: styleBold20,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.all(20),
                                color: Colors.amber.withOpacity(.3),
                                child: Text.rich(TextSpan(children: [
                                  TextSpan(
                                      text: "PENTING !", style: styleBold11),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Jumlah",
                                          style: styleGrey11,
                                        ),
                                        Text(
                                          IDR(int.parse(widget.jumlah)),
                                          style: styleGrey11,
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.payment),
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
                                padding: EdgeInsets.all(20),
                                height: img == null ? 130 : 200,
                                child: Column(
                                  children: [
                                    img == null
                                        ? Icon(
                                            Icons.camera_alt,
                                            size: 30,
                                            color: Colors.grey,
                                          )
                                        : Expanded(
                                            child: Container(
                                                width: 200,
                                                child: Image.file(img,
                                                    fit: BoxFit.cover))),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    RaisedButton(
                                      color: color1,
                                      onPressed: () {
                                        getImage();
                                      },
                                      child: Text(
                                        "Upload Bukti",
                                        style: styleSize9White,
                                      ),
                                    )
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
                                  TextSpan(
                                      text: "Transfer sebleum",
                                      style: styleGrey11),
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
                                  onPressed: () {
                                    DIALOG().dialogBatal(context);
                                  },
                                  child: Text(
                                    "Batalkan Pembayaran",
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
                              setState(() {
                                total = snapshot.data.documents.isEmpty
                                    ? 0
                                    : snapshot.data.documents[0]
                                            ['jumlah saldo'] +
                                        int.parse(widget.jumlah);
                              });
                              if (img == null) {
                                scaffoldState.currentState
                                    .showSnackBar(SnackBar(
                                  content: Text("Upload bukti pembayarab !"),
                                ));
                              } else {
                                scaffoldState.currentState
                                    .showSnackBar(SnackBar(
                                  content: Text("Tunggu..."),
                                  duration: Duration(seconds: 3),
                                ));
                                uploadPic(context).whenComplete(() {
                                  ServiceApp().addDonasiUser(
                                      widget.nama,
                                      widget.jenis,
                                      int.parse(widget.jumlah),
                                      widget.document,
                                      photoUrl,
                                      historySnapshot.data.documents[0]
                                          ['no rek']);
                                  if (snapshot.data.documents.isEmpty) {
                                    ServiceApp()
                                        .addDonasi(
                                            widget.instansi,
                                            int.parse(widget.jumlah),
                                            widget.debit,
                                            widget.norek)
                                        .whenComplete(() {
                                      DIALOG().dialogSuksesKonfirmasi(context);
                                    });
                                  } else {
                                    ServiceApp()
                                        .updateDonasi(
                                            snapshot
                                                .data.documents[0].reference,
                                            total)
                                        .whenComplete(() {
                                      DIALOG().dialogSuksesKonfirmasi(context);
                                    });
                                  }
                                });
                              }
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
                  );
                });
          }),
    );
  }
}
