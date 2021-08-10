import 'package:flutter/material.dart';
import 'package:penggalangandana/helper/config_onTap.dart';
import 'package:penggalangandana/layout/register_page.dart';

import 'package:penggalangandana/style/color.dart';
import 'package:penggalangandana/style/text_style.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController;
  TextEditingController passController;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    emailController = TextEditingController(text: "");
    passController = TextEditingController(text: "");
    super.initState();
  }

  @override
  void dispose() {
    emailController.clear();
    passController.clear();

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
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                      color: color1,
                      onPressed: () {
                        if (emailController.text.isEmpty ||
                            passController.text.isEmpty) {
                          snackBar("Mohon lengkapi data !");
                        } else {
                          ConfigOnTap().dialog(context);

                          ConfigOnTap()
                              .onLoginTap(emailController, passController,
                                  context, snackBar, "Email tidak terdaftar !")
                              .whenComplete(() {
                            Navigator.pop(context);
                          });
                        }
                      },
                      child: Text(
                        "Login",
                        style: styleNormalWhite,
                      )),
                  // ignore: deprecated_member_use
                  FlatButton(
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Register())),
                      child: Text(
                        "Register",
                        style: styleNormal,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFormField(String hinText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: TextFormField(
        validator: (validasi) {
          if (validasi == null || validasi.isEmpty)
            return "Jumlah Donasi Wajib di isi !";
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
