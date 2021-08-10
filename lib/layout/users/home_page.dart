import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:penggalangandana/helper/idr_help.dart';
import 'package:penggalangandana/helper/size_help.dart';
import 'package:penggalangandana/layout/users/profile_page.dart';
import 'package:penggalangandana/model/users/donasi.dart';
import 'package:penggalangandana/model/users/donasi_sekarang.dart';

import 'package:penggalangandana/style/color.dart';
import 'package:penggalangandana/style/text_style.dart';

class HomePage extends StatefulWidget {
  String email;
  HomePage({Key key, this.email}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String type = "";
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
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
            int saldo = snapshot.data.documents[0]['saldo'];
            return Container(
              height: SIZE().height(context),
              width: SIZE().widht(context),
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    width: SIZE().widht(context),
                    decoration: BoxDecoration(
                        color: color2,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                  ),
                  Positioned(
                    top: 50,
                    left: 20,
                    right: 20,
                    bottom: 0,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: colorWhite,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.3),
                                    blurRadius: 15,
                                    spreadRadius: 1,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Profile(
                                                  document: snapshot.data
                                                      .documents[0].documentID,
                                                  email: widget.email,
                                                  img:
                                                      "assets/images/icons/baitul mal.png",
                                                )));
                                  },
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
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        // ignore: deprecated_member_use
                                        child: RaisedButton(
                                          color: colorWhite,
                                          onPressed: () {
                                            setState(() {
                                              type = "kredit";
                                              selected = true;
                                            });
                                          },
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Kredit",
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
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      // ignore: deprecated_member_use
                                      child: RaisedButton(
                                        color: colorWhite,
                                        onPressed: () {
                                          setState(() {
                                            type = "debit";
                                            selected = true;
                                          });
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
                                              width: 59,
                                              height: 50,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                // Container(
                                //   height: 50,
                                //   width: double.infinity,
                                //   decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.circular(5),
                                //       color: colorWhite,
                                //       boxShadow: [
                                //         BoxShadow(
                                //             color:
                                //                 Colors.black54.withOpacity(.1),
                                //             blurRadius: 15,
                                //             offset: Offset(3, 3))
                                //       ]),
                                //   child: Row(
                                //     children: [
                                //       Container(
                                //         height: 70,
                                //         width: 100,
                                //         decoration: BoxDecoration(
                                //           color: color2,
                                //           borderRadius: BorderRadius.only(
                                //               topLeft: Radius.circular(5),
                                //               bottomLeft: Radius.circular(5)),
                                //         ),
                                //         child: Icon(
                                //           Icons.payment,
                                //           color: colorWhite,
                                //         ),
                                //       ),
                                //       Expanded(
                                //           child: Container(
                                //         padding: EdgeInsets.only(left: 10),
                                //         child: Text(
                                //           IDR(saldo).toString(),
                                //           style: styleBold,
                                //         ),
                                //       )),
                                //     ],
                                //   ),
                                // )
                                Container(
                                  child: StreamBuilder(
                                      stream: Firestore.instance
                                          .collection("users")
                                          .document(snapshot
                                              .data.documents[0].documentID)
                                          .collection(type == "debit"
                                              ? "debit"
                                              : "kredit user")
                                          .snapshots(),
                                      builder: (context,
                                          AsyncSnapshot<QuerySnapshot>
                                              historySnapshot) {
                                        if (historySnapshot.data == null) {
                                          return SizedBox();
                                        }
                                        return InkWell(
                                          onTap: () {
                                            setState(() {
                                              type = "";
                                              selected = false;
                                            });
                                          },
                                          child: AnimatedContainer(
                                            duration:
                                                Duration(microseconds: 100),
                                            curve: Curves.easeInOut,
                                            height: selected == false ? 0 : 80,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: colorWhite,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black54
                                                          .withOpacity(.1),
                                                      blurRadius: 15,
                                                      offset: Offset(3, 3))
                                                ]),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                selected == false
                                                    ? SizedBox()
                                                    : historySnapshot.data
                                                            .documents.isEmpty
                                                        ? Text("")
                                                        : Icon(Icons.payment),
                                                selected == false
                                                    ? SizedBox()
                                                    : Text(
                                                        historySnapshot
                                                                .data
                                                                .documents
                                                                .isEmpty
                                                            ? ""
                                                            : historySnapshot
                                                                    .data
                                                                    .documents[
                                                                0]['no rek'],
                                                        style: styleGreenNormal,
                                                      ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            "Instansi",
                            style: styleBold,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Donasi(
                                                email: widget.email,
                                                nama: nama,
                                                nik: nik,
                                                document: snapshot.data
                                                    .documents[0].documentID,
                                                instansi: '1',
                                                img:
                                                    "assets/images/icons/baitul mal.png",
                                              )));
                                },
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.account_balance_rounded,
                                      color: color1,
                                    ),
                                    Text(
                                      "Beasiswa\nPrestasi Duafa",
                                      style: styleGrey11,
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Donasi(
                                                email: widget.email,
                                                nama: nama,
                                                nik: nik,
                                                document: snapshot.data
                                                    .documents[0].documentID,
                                                instansi: '2',
                                                img:
                                                    "assets/images/icons/logo.png",
                                              )));
                                },
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.account_tree_sharp,
                                      color: color1,
                                    ),
                                    Text(
                                      "Beasiswa\nPrestasi Pintar",
                                      style: styleGrey11,
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Donasi(
                                                email: widget.email,
                                                nama: nama,
                                                nik: nik,
                                                document: snapshot.data
                                                    .documents[0].documentID,
                                                instansi: '3',
                                                img:
                                                    "assets/images/icons/amanah takaful.png",
                                              )));
                                },
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.accessibility_new_outlined,
                                      color: color1,
                                    ),
                                    Text(
                                      "Beasiswa\nPrestasi Yatim",
                                      style: styleGrey11,
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Mualilah Berdonasi",
                            style: styleBold,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  height: 100,
                                  margin: EdgeInsets.only(right: 10, left: 10),
                                  width: 200,
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: color1.withOpacity(.4),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text.rich(TextSpan(children: [
                                    TextSpan(
                                      text: "Donasi Rutin\n",
                                      style: styleNormal,
                                    ),
                                    TextSpan(
                                      text:
                                          "Perbanya pahala tiap harinya dengan saling membantu",
                                      style: styleSize9White,
                                    ),
                                  ])),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  padding: EdgeInsets.all(20),
                                  height: 100,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color: color2.withOpacity(.4),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text.rich(TextSpan(children: [
                                    TextSpan(
                                      text: "Berbagi Itu Indah \n",
                                      style: styleNormal,
                                    ),
                                    TextSpan(
                                      text: "Yuk, Kawan Kita bantu kaum duafa",
                                      style: styleSize9White,
                                    ),
                                  ])),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 20),
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: color2,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: -30,
                                  right: -30,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20))),
                                    height: 200,
                                    width: 200,
                                    child: CircleAvatar(
                                      backgroundImage:
                                          AssetImage("assets/images/duafa.jpg"),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 80,
                                  left: 20,
                                  right: 20,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Mulai berdonasi sekarang juga, banyak disana yang sangan membutuhkan bantuan anda",
                                        style: styleNormalWhite11,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      // ignore: deprecated_member_use
                                      RaisedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DonasiSekarangPage(
                                                        email: widget.email,
                                                        nama: nama,
                                                        nik: nik,
                                                      )));
                                        },
                                        child: Text(
                                          "Donasi Sekarang",
                                          style: styleSize9White,
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        color: Colors.red,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
