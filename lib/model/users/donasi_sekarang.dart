import 'package:flutter/material.dart';
import 'package:penggalangandana/helper/idr_help.dart';
import 'package:penggalangandana/model/users/donasi.dart';
import 'package:penggalangandana/style/color.dart';

class DonasiSekarangPage extends StatelessWidget {
  DonasiSekarangPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instansi"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 15, left: 15),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              color: colorWhite,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Donasi(
                                instansi: '1',
                                img: "assets/images/icons/baitul mal.png",
                              )));
                },
                leading: Image.asset("assets/images/icons/baitul mal.png"),
                title: Text("Baitul Mal"),
                subtitle: Text("Butuh " + IDR(1500090).toString()),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: colorWhite,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Donasi(
                                instansi: '2',
                                img: "assets/images/icons/logo.png",
                              )));
                },
                leading: Image.asset(
                  "assets/images/icons/logo.png",
                  width: 100,
                  height: 80,
                ),
                title: Text("Dompet Dhuafa"),
                subtitle: Text("Butuh " + IDR(1500090).toString()),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: colorWhite,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Donasi(
                                instansi: '3',
                                img: "assets/images/icons/amanah takaful.png",
                              )));
                },
                leading: Image.asset(
                  "assets/images/icons/amanah takaful.png",
                  width: 100,
                  height: 80,
                ),
                title: Text("Amanah Takaful"),
                subtitle: Text("Butuh " + IDR(1500090).toString()),
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
}
