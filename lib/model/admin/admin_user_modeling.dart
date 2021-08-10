import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:penggalangandana/database/penggalangan_app_base.dart';
import 'package:penggalangandana/helper/size_help.dart';
import 'package:penggalangandana/model/admin/donasi_modeling.dart';
import 'package:penggalangandana/style/color.dart';
import 'package:penggalangandana/style/text_style.dart';

class UserDonasi extends StatefulWidget {
  String konfirmasi;

  UserDonasi({Key key, this.konfirmasi}) : super(key: key);

  @override
  _UserDonasiState createState() => _UserDonasiState();
}

class _UserDonasiState extends State<UserDonasi> {
  var documentUser;

  @override
  void initState() {
    Firestore.instance.collection("users").snapshots().listen((dataUser) {
      for (var i = 0; i < dataUser.documents.length; i++) {
        Firestore.instance
            .collection("users")
            .document(dataUser.documents[i].documentID)
            .collection("donasi user")
            .snapshots()
            .listen((snapshot) {
          if (snapshot.documents.isEmpty) {
            setState(() {
              documentUser = null;
              debugPrint("document User" + documentUser.toString());
            });
          } else {
            setState(() {
              documentUser = 1;
              debugPrint("document User" + documentUser.toString());
            });
          }
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance.collection("users").snapshots(),
        // ignore: missing_return
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.data == null) {
            return SizedBox();
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  color: color1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        padding: EdgeInsets.all(50),
                        decoration: BoxDecoration(
                            color: colorWhite,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(.6),
                                  blurRadius: 10,
                                  offset: Offset(3, 3))
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "admin@gmail.com",
                                  style: styleGreenNormal,
                                ),
                                Text(
                                  "Level : Admin",
                                  style: styleGrey11,
                                )
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                ServiceApp().signOut();
                              },
                              child: Icon(
                                Icons.exit_to_app,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "List User",
                    style: styleBold,
                  ),
                ),
                Container(
                  height: SIZE().height(context),
                  width: SIZE().widht(context),
                  margin: EdgeInsets.only(top: 10),
                  child: ListView.builder(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      shrinkWrap: true,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        return StreamBuilder(
                            stream: Firestore.instance
                                .collection("users")
                                .document(
                                    snapshot.data.documents[index].documentID)
                                .collection("donasi user")
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot1) {
                              if (snapshot1.data == null) {
                                return SizedBox();
                              }
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    color: colorWhite,
                                    child: Stack(
                                      children: [
                                        ListTile(
                                          // onTap: () {
                                          //   if (widget.konfirmasi == "") {
                                          //     Navigator.push(
                                          //         context,
                                          //         MaterialPageRoute(
                                          //             builder: (context) => DetailUserDonasi(
                                          //                   donasi: IDR(187).toString(),
                                          //                   image: "assets/images/person.jpeg",
                                          //                   nama: snapshot.data.documents[index]
                                          //                       ['nama'],
                                          //                 )));
                                          //   } else {
                                          //     DIALOG().dialogInfo(context);
                                          //   }
                                          // },
                                          leading: CircleAvatar(
                                            backgroundColor: colorWhite,
                                            child: Icon(
                                              Icons.circle_notifications,
                                              size: 40,
                                            ),
                                          ),
                                          title: Text(
                                            snapshot.data.documents[index]
                                                ['nama'],
                                            style: styleNormal11,
                                          ),
                                          subtitle: Text(
                                            "NIK " +
                                                snapshot.data
                                                    .documents[index]['nik']
                                                    .toString(),
                                            style: styleGreenNormal11,
                                          ),
                                          trailing:
                                              widget.konfirmasi == "sukses"
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
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        DonasiAdminModel(
                                                                          document: snapshot
                                                                              .data
                                                                              .documents[index]
                                                                              .documentID,
                                                                        )));
                                                      },
                                                      child: Text(
                                                        "Lihat",
                                                        style:
                                                            styleNormalWhite11,
                                                      ),
                                                    ),
                                        ),
                                        Positioned(
                                          top: 9,
                                          left: 10,
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            child: CircleAvatar(
                                              backgroundColor: snapshot1.data
                                                          .documents.length ==
                                                      0
                                                  ? Colors.transparent
                                                  : color1,
                                              child: Text(
                                                  snapshot1
                                                      .data.documents.length
                                                      .toString(),
                                                  style: styleSize9White),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            });
                      }),
                ),
              ],
            ),
          );
        });
  }
}
