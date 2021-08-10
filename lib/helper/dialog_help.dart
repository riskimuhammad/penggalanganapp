import 'package:flutter/material.dart';
import 'package:penggalangandana/layout/users/home_page.dart';
import 'package:penggalangandana/style/color.dart';
import 'package:penggalangandana/style/text_style.dart';

class DIALOG {
  dialogSukses(context, widget) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              height: 150,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Terimakasi orang baik, semoga amalan anda diterima oleh yang Maha Kuasa :)",
                    style: styleGreenNormal11,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => widget));
                      },
                      child: Text(
                        "OK",
                        style: styleNormalWhite11,
                      ),
                      color: color1,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  dialogSuksesKonfirmasi(context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              height: 150,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Terimakasi orang baik, semoga amalan anda diterima oleh yang Maha Kuasa :)",
                    style: styleGreenNormal11,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text(
                        "OK",
                        style: styleNormalWhite11,
                      ),
                      color: color1,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  dialogSuksesSimpan(context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              height: 150,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Terimakasi, saldo anda sedang di proses !",
                    style: styleGreenNormal11,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                            (route) => false);
                      },
                      child: Text(
                        "OK",
                        style: styleNormalWhite11,
                      ),
                      color: color1,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  dialogInfo(context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              height: 150,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sudah terkonfirmasi. Terimaksih !",
                    style: styleGreenNormal11,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                            (route) => false);
                      },
                      child: Text(
                        "OK",
                        style: styleNormalWhite11,
                      ),
                      color: color1,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  dialogInfoAdmin(context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              height: 150,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sudah terkonfirmasi. Terimaksih !",
                    style: styleGreenNormal11,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "OK",
                        style: styleNormalWhite11,
                      ),
                      color: color1,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  dialogBatal(context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              height: 150,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Anda yakin ingin membatalkannya ?",
                    style: styleGreenNormal11,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    // ignore: deprecated_member_use
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        RaisedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "tidak",
                            style: styleNormalWhite11,
                          ),
                          color: color1,
                        ),
                        RaisedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Text(
                            "iya",
                            style: styleNormalWhite11,
                          ),
                          color: color1,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
