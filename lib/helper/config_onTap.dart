import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:penggalangandana/database/penggalangan_app_base.dart';

class ConfigOnTap {
  onSaveUser(BuildContext context, emailController, namaController,
      nikController, passController, snackBar, text) {
    Firestore.instance
        .collection('users')
        .where("email", isEqualTo: emailController.text)
        .snapshots()
        .listen((value) {
      if (value.documents.isEmpty) {
        dialog(context);
        ServiceApp.userCreate(namaController.text, emailController.text,
                passController.text, nikController.text)
            .whenComplete(() {
          Navigator.pop(context);
          Navigator.pop(context);
        });
      } else {
        snackBar(text);
        emailController.clear();
        passController.clear();
        namaController.clear();
        nikController.clear();
      }
    });
  }

  Future onLoginTap(
      emailController, passController, context, snackBar, text) async {
    if (emailController.text == "admin@gmail.com") {
      ServiceApp.loginEmailPassword(emailController.text, passController.text)
          .whenComplete(() {
        print("berhasil");
      });
    } else {
      Firestore.instance
          .collection('users')
          .where("email", isEqualTo: emailController.text)
          .snapshots()
          .listen((value) {
        if (value.documents.isEmpty) {
          snackBar(text);
          emailController.clear();
          passController.clear();
        } else {
          ServiceApp.loginEmailPassword(
                  emailController.text, passController.text)
              .whenComplete(() {
            print("berhasil");
          });
        }
      });
    }
  }

  Future dialog(context) async {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              child: Container(
                color: Colors.transparent,
                height: 150,
                width: 150,
                child: Image.asset('assets/images/indicator/loading.gif'),
              ),
            ));
  }
}
