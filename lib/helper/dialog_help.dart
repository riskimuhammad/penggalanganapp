import 'package:flutter/material.dart';
import 'package:penggalangandana/style/color.dart';
import 'package:penggalangandana/style/text_style.dart';

class DIALOG {
  dialogSukses(context) {
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
}