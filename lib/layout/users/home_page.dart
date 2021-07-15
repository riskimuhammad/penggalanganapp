import 'package:flutter/material.dart';
import 'package:penggalangandana/helper/idr_help.dart';
import 'package:penggalangandana/helper/size_help.dart';
import 'package:penggalangandana/model/users/donasi.dart';

import 'package:penggalangandana/style/color.dart';
import 'package:penggalangandana/style/text_style.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                      height: 250,
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
                            leading: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/person.jpeg"),
                            ),
                            title: Text(
                              "Muhammad Riski",
                              style: styleBold,
                            ),
                            subtitle: Text(
                              "ID : 1111782877819",
                              style: styleSize11,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 60),
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: colorWhite,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black54.withOpacity(.1),
                                      blurRadius: 15,
                                      offset: Offset(3, 3))
                                ]),
                            child: Row(
                              children: [
                                Container(
                                  height: 70,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: color2,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        bottomLeft: Radius.circular(5)),
                                  ),
                                  child: Icon(
                                    Icons.payment,
                                    color: colorWhite,
                                  ),
                                ),
                                Expanded(
                                    child: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    IDR(1000000).toString(),
                                    style: styleBold,
                                  ),
                                )),
                              ],
                            ),
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
                                          instansi: '1',
                                          img:
                                              "assets/images/icons/baitul mal.png",
                                        )));
                          },
                          child: CircleAvatar(
                            backgroundColor: color2.withOpacity(.2),
                            backgroundImage: AssetImage(
                                "assets/images/icons/baitul mal.png"),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Donasi(
                                          instansi: '2',
                                          img: "assets/images/icons/logo.png",
                                        )));
                          },
                          child: Image.asset(
                            "assets/images/icons/logo.png",
                            height: 30,
                            width: 70,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Donasi(
                                          instansi: '3',
                                          img:
                                              "assets/images/icons/amanah takaful.png",
                                        )));
                          },
                          child: Image.asset(
                            "assets/images/icons/amanah takaful.png",
                            height: 30,
                            width: 70,
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
                      margin: EdgeInsets.only(top: 10),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  onPressed: () {},
                                  child: Text(
                                    "Donasi Sekarang",
                                    style: styleSize9White,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
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
      ),
    );
  }
}
