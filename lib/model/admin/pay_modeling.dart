import 'package:flutter/material.dart';
import 'package:penggalangandana/helper/idr_help.dart';
import 'package:penggalangandana/helper/size_help.dart';
import 'package:penggalangandana/style/color.dart';
import 'package:penggalangandana/style/text_style.dart';

class PayAdminModel extends StatefulWidget {
  const PayAdminModel({Key key}) : super(key: key);

  @override
  _PayAdminModelState createState() => _PayAdminModelState();
}

class _PayAdminModelState extends State<PayAdminModel>
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
                  ),
                  Konfirmasi(
                    konfirmasi: "sukses",
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Konfirmasi extends StatefulWidget {
  String konfirmasi;
  Konfirmasi({Key key, this.konfirmasi}) : super(key: key);

  @override
  _KonfirmasiState createState() => _KonfirmasiState();
}

class _KonfirmasiState extends State<Konfirmasi> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: colorWhite,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/person.jpeg"),
              ),
              title: Text(
                "Muhammad Riski",
                style: styleNormal11,
              ),
              subtitle: Text(
                "Saldo " + IDR(1500090).toString(),
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
                      onPressed: () {},
                      child: Text(
                        "Konfirmasi",
                        style: styleNormalWhite11,
                      ),
                    ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: colorWhite,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/person.jpeg"),
              ),
              title: Text(
                "Muhammad Riski",
                style: styleNormal11,
              ),
              subtitle: Text(
                "Saldo " + IDR(1500090).toString(),
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
                      onPressed: () {},
                      child: Text(
                        "Konfirmasi",
                        style: styleNormalWhite11,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
