import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:penggalangandana/database/penggalangan_app_base.dart';
import 'package:penggalangandana/helper/dialog_help.dart';
import 'package:penggalangandana/helper/idr_help.dart';
import 'package:penggalangandana/helper/size_help.dart';
import 'package:penggalangandana/model/admin/deatil_user_donasi.dart';
import 'package:penggalangandana/style/color.dart';
import 'package:penggalangandana/style/text_style.dart';

class DonasiAdminModel extends StatefulWidget {
  var document;
  DonasiAdminModel({Key key, this.document}) : super(key: key);

  @override
  _DonasiAdminModelState createState() => _DonasiAdminModelState();
}

class _DonasiAdminModelState extends State<DonasiAdminModel>
    with TickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: controller.index == 1
            ? null
            : FloatingActionButton(
                backgroundColor: color1,
                child: Icon(Icons.info),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => Dialog(
                            child: Container(
                              height: 200,
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  Positioned(
                                      right: 15,
                                      left: 15,
                                      top: 20,
                                      child: Center(
                                          child: Text(
                                        "Klik card untuk melihat detail donasi",
                                        style: styleNormal11,
                                      ))),
                                  Positioned(
                                    left: 15,
                                    right: 15,
                                    top: 40,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: colorWhite,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 15,
                                                offset: Offset(
                                                  3,
                                                  3,
                                                ))
                                          ]),
                                      margin: EdgeInsets.only(top: 10),
                                      child: ListTile(
                                        contentPadding: EdgeInsets.all(10),
                                        onTap: () {},
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              "assets/images/person.jpeg"),
                                        ),
                                        title: Text(
                                          "Muhammad Riski",
                                          style: styleNormal9,
                                        ),
                                        subtitle: Text(
                                          "Donasi " + IDR(1500090).toString(),
                                          style: styleGreenNormal11,
                                        ),
                                        trailing: Container(
                                          width: 50,
                                          height: 30,
                                          child: RaisedButton(
                                            padding: EdgeInsets.all(0),
                                            color: color1,
                                            onPressed: () {},
                                            child: Text(
                                              "Konfirmasi",
                                              style: styleSize5White,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 60,
                                      left: 150,
                                      child: Image.asset(
                                        "assets/images/Click.gif",
                                        width: 50,
                                        height: 50,
                                      ))
                                ],
                              ),
                            ),
                          ));
                },
              ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TabBar(
                    unselectedLabelColor: Colors.grey,
                    labelColor: color1,
                    controller: controller,
                    tabs: [
                      Tab(
                        icon: Icon(Icons.close),
                        text: "Tidak Terkonfirmasi",
                      ),
                      Tab(
                        icon: Icon(Icons.check),
                        text: "Terkonfirmasi",
                      ),
                    ]),
                Container(
                  height: SIZE().height(context) - 140,
                  width: SIZE().widht(context),
                  child: TabBarView(controller: controller, children: [
                    Konfirmasi(
                      konfirmasi: "",
                      document: widget.document,
                    ),
                    Konfirmasi(
                      konfirmasi: "sukses",
                      document: widget.document,
                    ),
                  ]),
                )
              ],
            ),
          ),
        ));
  }
}

class Konfirmasi extends StatefulWidget {
  String konfirmasi;
  var document;

  Konfirmasi({Key key, this.konfirmasi, @required this.document})
      : super(key: key);

  @override
  _KonfirmasiState createState() => _KonfirmasiState();
}

class _KonfirmasiState extends State<Konfirmasi> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance
            .collection("users")
            .document(widget.document)
            .collection("donasi user")
            .where("verifikasi",
                isEqualTo: widget.konfirmasi == "" ? "" : "sukses")
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.data == null) {
            return SizedBox();
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: double.infinity,
                  color: color1,
                  child: Center(
                    child: Text(
                      widget.konfirmasi == ""
                          ? "Data Belum Di Verifikasi   " +
                              snapshot.data.documents.length.toString()
                          : "Data Sudah Di Verifikasi   " +
                              snapshot.data.documents.length.toString(),
                      style: styleNormalWhite,
                    ),
                  ),
                ),
                Container(
                  height: SIZE().height(context),
                  width: SIZE().widht(context),
                  child: ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              color: colorWhite,
                              child: ListTile(
                                onTap: () {
                                  if (widget.konfirmasi == "") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailUserDonasi(
                                                  rek: snapshot.data
                                                      .documents[index]['rek'],
                                                  donasi: snapshot
                                                      .data
                                                      .documents[index]
                                                          ['jumlah']
                                                      .toString(),
                                                  image:
                                                      "assets/images/person.jpeg",
                                                  nama: snapshot.data
                                                      .documents[index]['nama'],
                                                )));
                                  } else {
                                    DIALOG().dialogInfoAdmin(context);
                                  }
                                },
                                leading: CircleAvatar(
                                  backgroundColor: color1,
                                  child: Icon(
                                    Icons.person,
                                    color: colorWhite,
                                  ),
                                ),
                                title: Text(
                                  snapshot.data.documents[index]['nama'],
                                  style: styleNormal11,
                                ),
                                subtitle: Text(
                                  "Donasi " +
                                      IDR(snapshot.data.documents[index]
                                              ['jumlah'])
                                          .toString(),
                                  style: styleGreenNormal11,
                                ),
                                trailing: widget.konfirmasi == "sukses"
                                    ? CircleAvatar(
                                        backgroundColor: color1,
                                        child: Icon(
                                          Icons.check,
                                          color: colorWhite,
                                        ),
                                      )
                                    : RaisedButton(
                                        color: color1,
                                        onPressed: () {
                                          ServiceApp()
                                              .updateDonasiUser(snapshot.data
                                                  .documents[index].reference)
                                              .whenComplete(() {
                                            DIALOG().dialogInfoAdmin(context);
                                          });
                                        },
                                        child: Text(
                                          "Konfirmasi",
                                          style: styleNormalWhite11,
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              ],
            ),
          );
        });
  }
}
