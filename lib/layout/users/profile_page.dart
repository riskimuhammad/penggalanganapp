import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:penggalangandana/database/penggalangan_app_base.dart';
import 'package:flutter/material.dart';
import 'package:penggalangandana/helper/idr_help.dart';
import 'package:penggalangandana/helper/size_help.dart';
import 'package:penggalangandana/model/users/form/form_tambah_debit.dart';
import 'package:penggalangandana/model/users/form/form_tambah_kredit.dart';
import 'package:penggalangandana/model/users/form/form_tambah_saldo.dart';
import 'package:penggalangandana/style/color.dart';
import 'package:penggalangandana/style/text_style.dart';

// ignore: must_be_immutable
class Profile extends StatefulWidget {
  String img, email;
  var document;
  Profile({Key key, @required this.img, this.email, this.document})
      : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: styleBold,
        ),
      ),
      body: StreamBuilder(
          stream: Firestore.instance
              .collection("users")
              .where("email", isEqualTo: widget.email)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.data == null) {
              return SizedBox();
            }
            String nama = snapshot.data.documents[0]['nama'];
            String nik = snapshot.data.documents[0]['nik'];

            return StreamBuilder(
                stream: Firestore.instance
                    .collection("users")
                    .document(widget.document)
                    .collection("donasi user")
                    .snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> historySnapshot) {
                  if (historySnapshot.data == null) {
                    return SizedBox();
                  }

                  return Padding(
                      padding: const EdgeInsets.only(
                          top: 30, left: 15, right: 15, bottom: 20),
                      child: SingleChildScrollView(
                        physics: ScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: color1.withOpacity(.2),
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                trailing: InkWell(
                                  onTap: () {
                                    ServiceApp().signOut().then((value) {
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Icon(
                                    Icons.logout,
                                    color: Colors.grey,
                                  ),
                                ),
                                leading: CircleAvatar(
                                  backgroundColor: color1,
                                  // backgroundImage: AssetImage("assets/images/person.jpeg"),
                                  child: Icon(Icons.account_circle,
                                      color: colorWhite),
                                ),
                                title: Text(
                                  nama,
                                  style: styleBold,
                                ),
                                subtitle: Text(
                                  "ID : $nik",
                                  style: styleSize11,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              width: double.infinity,
                              child: Row(
                                children: [
                                  // ignore: deprecated_member_use
                                  RaisedButton(
                                    color: colorWhite,
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FormCreditCard(
                                                    document: widget.document,
                                                  )));
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Tambah Kredit",
                                          style: styleBold11,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Image.asset(
                                          "assets/images/visa-mastercard.png",
                                          width: 50,
                                          height: 50,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: RaisedButton(
                                        color: colorWhite,
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FormDebit(
                                                        document:
                                                            widget.document,
                                                      )));
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Debit ",
                                              style: styleBold11,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Image.asset(
                                              "assets/images/bank.png",
                                              width: 72,
                                              height: 50,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Container(
                            //     margin: EdgeInsets.only(bottom: 20, top: 10),
                            //     height: 50,
                            //     width: double.infinity,
                            //     child: RaisedButton(
                            //       color: colorWhite,
                            //       onPressed: () {
                            //         Navigator.push(
                            //             context,
                            //             MaterialPageRoute(
                            //                 builder: (context) =>
                            //                     TambahSaldo()));
                            //       },
                            //       child: Text("Tambah Saldo +"),
                            //     )),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Riwayat Donasi",
                              style: styleBold,
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            Container(
                              height: 500,
                              width: SIZE().widht(context),
                              child: ListView.builder(
                                  physics: ScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      historySnapshot.data.documents.length,
                                  itemBuilder: (context, index) {
                                    int jumlah = historySnapshot
                                        .data.documents[index]['jumlah'];
                                    String type = historySnapshot
                                        .data.documents[index]['type'];
                                    return Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      child: Column(children: [
                                        ListTile(
                                          leading: Icon(
                                              historySnapshot.data
                                                              .documents[index]
                                                          ['verifikasi'] ==
                                                      ""
                                                  ? Icons.info
                                                  : Icons.check_box,
                                              color: color1),
                                          trailing: Image.asset(widget.img),
                                          title: Text("$type"),
                                          subtitle: Text("Jumlah Donasi : " +
                                              IDR(jumlah).toString()),
                                        ),
                                      ]),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ));
                });
          }),
    );
  }
}
