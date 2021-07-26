import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:penggalangandana/helper/size_help.dart';
import 'package:penggalangandana/style/color.dart';
import 'package:penggalangandana/style/text_style.dart';

class registerPage extends StatefulWidget {
  registerPage({Key key}) : super(key: key);

  @override
  _registerPageState createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  TextEditingController emailController;
  TextEditingController namaController;
  TextEditingController passController;
  TextEditingController nikController;
  @override
  void initState() {
    emailController = TextEditingController(text: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: SIZE().height(context),
          width: SIZE().widht(context),
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textFormField(namaController, 'Nama', 'john wick'),
                    textFormField(nikController, 'NIK', '11080XXXXXXXXXXX'),
                    textFormField(
                        emailController, 'Email', 'example@company.com'),
                    textFormField(passController, 'Password', '********'),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 100,
                width: SIZE().widht(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      width: SIZE().widht(context),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        onPressed: () {},
                        color: color1,
                        child: Text(
                          "Register",
                          style: styleNormalWhite11,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Do you have an account ?",
                        style: styleGreenNormal11,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextFormField textFormField(controller, label, hint) {
    return TextFormField(
      controller: controller,
      obscureText: label == 'Password' ? true : false,
      decoration: InputDecoration(
          hintText: '$hint',
          hintStyle: styleGrey11,
          border: UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: color1)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: color1)),
          labelText: '$label',
          labelStyle: styleGreenNormal),
    );
  }
}
