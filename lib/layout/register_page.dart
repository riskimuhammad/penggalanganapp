import 'package:flutter/material.dart';

import 'package:penggalangandana/helper/config_onTap.dart';

import 'package:penggalangandana/style/color.dart';
import 'package:penggalangandana/style/text_style.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailController;
  TextEditingController nikController;
  TextEditingController passController;
  TextEditingController namaController;

  // ignore: unused_field
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    emailController = TextEditingController(text: "");
    passController = TextEditingController(text: "");
    namaController = TextEditingController(text: "");
    nikController = TextEditingController(text: "");
    super.initState();
  }

  @override
  void dispose() {
    emailController.clear();
    passController.clear();
    namaController.clear();
    nikController.clear();
    super.dispose();
  }

  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();
  snackBar(text) {
    // ignore: deprecated_member_use
    _scaffoldState.currentState.showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _textFormField('Nama', namaController),
          SizedBox(
            height: 15,
          ),
          _textFormField('Nik', nikController),
          SizedBox(
            height: 15,
          ),
          _textFormField('Email', emailController),
          SizedBox(
            height: 15,
          ),
          _textFormField('Password', passController),
          Padding(
            padding: const EdgeInsets.only(right: 40, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // ignore: deprecated_member_use
                FlatButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Back",
                      style: styleNormal,
                    )),
                // ignore: deprecated_member_use
                FlatButton(
                    color: color1,
                    onPressed: () {
                      if (namaController.text.isEmpty ||
                          emailController.text.isEmpty ||
                          nikController.text.isEmpty ||
                          passController.text.isEmpty) {
                        snackBar("Mohon lengkapi data !");
                      } else {
                        ConfigOnTap().onSaveUser(
                            context,
                            emailController,
                            namaController,
                            nikController,
                            passController,
                            snackBar,
                            "Email sudah terdaftar !");
                      }
                    },
                    child: Text(
                      "Register",
                      style: styleNormalWhite,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _textFormField(String hinText, controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: TextFormField(
        maxLength: hinText == 'Nik' ? 16 : null,
        validator: (validasi) {
          if (validasi == null || validasi.isEmpty)
            return hinText == "Email"
                ? 'Email tidak boleh kosong'
                : 'Password tidak boleh kosong';
          else
            return "";
        },
        controller: controller,
        obscureText: hinText == 'Password' ? true : false,
        decoration: InputDecoration(hintText: hinText),
      ),
    );
  }
}
