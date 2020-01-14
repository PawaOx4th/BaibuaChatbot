import 'dart:io';

import 'package:baibuaapp/REST%20API/register.dart';
import 'package:baibuaapp/screens/Authenticate/autu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:http/http.dart' as Http;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
//  Validate Variable
  final formKeyRegister = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

//  Variable  form  Email Input, Student-id Input and Password Input
  String _stuIdRegister, _emailRegister, _passwordRegister, _repasswordRegister;

  bool isRegister = false;

  static const List<Key> keys = [
    Key("Network"),
    Key("NetworkDialog"),
    Key("Flare"),
    Key("FlareDialog"),
    Key("Asset"),
    Key("AssetDialog")
  ];

//Error
  String error = '';

// BoxDecoration Style
  BoxDecoration _boxDecorationInput = BoxDecoration(
    color: Color.fromRGBO(240, 244, 248, 1),
    borderRadius: BorderRadius.circular(50.0),
  );

//  TextController
  TextEditingController stuId, email, pass, re_pass;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 1080, height: 2160, allowFontScaling: true)
          ..init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 50),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(20),
                      ),
                      Form(
                        key: formKeyRegister,
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 36.0, bottom: 10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.transparent),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Text(
                                      "Create Account",
                                      style: TextStyle(
                                        color: Colors.lightBlue,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  studentIdInput(),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  emailInput(),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  passwordInput(),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  re_passwordInput(),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    error,
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 14.0),
                                  ),
                                  registerBtn(btnname: "Sign Up"),
                                  SizedBox(
                                    height: 5,
                                  ),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget studentIdInput() => Container(
        decoration: _boxDecorationInput,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
            child: TextFormField(
              maxLength: 13,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                counterStyle: TextStyle(
                  height: double.minPositive,
                ),
                counterText: "",
                hintText: "รหัสนักศึกษา",
                prefixIcon: Icon(Icons.payment),
//              border: InputBorder.none,
                hintStyle: GoogleFonts.kanit(
                  textStyle: TextStyle(color: Colors.black38, fontSize: 14.0),
                ),
              ),
              //** Validator ID
              validator: validateStudentId,
              controller: stuId,
//        controller: ,
              onChanged: (val) {
                setState(() {
                  _stuIdRegister = val;
                });
              },
            )),
      );

  Widget emailInput() => Container(
        decoration: _boxDecorationInput,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 18),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(Icons.email),
              border: InputBorder.none,
              hintStyle: GoogleFonts.kanit(
                textStyle: TextStyle(color: Colors.black38, fontSize: 14.0),
              ),
            ),
            validator: validateEmail,
            controller: email,
            onChanged: (val) {
              setState(() {
                _emailRegister = val;
              });
            },
          ),
        ),
      );

  Widget passwordInput() => Container(
        decoration: _boxDecorationInput,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 18),
          child: TextFormField(
              obscureText: true,
              maxLength: 6,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                counterText: "",
                hintText: "Password",
                prefixIcon: Icon(Icons.vpn_key),
                border: InputBorder.none,
                hintStyle: GoogleFonts.kanit(
                  textStyle: TextStyle(color: Colors.black38, fontSize: 14.0),
                ),
                counterStyle: TextStyle(
                  height: double.minPositive,
                ),
              ),
              validator: validatePassword,
              controller: pass,
              onChanged: (val) {
                setState(() {
                  _passwordRegister = val;
                });
              }),
        ),
      );

  Widget re_passwordInput() => Container(
        decoration: _boxDecorationInput,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 18),
          child: TextFormField(
              obscureText: true,
              maxLength: 6,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                counterText: "",
                counterStyle: TextStyle(
                  height: double.minPositive,
                ),
                hintText: "re-password",
                prefixIcon: Icon(Icons.vpn_key),
                border: InputBorder.none,
                hintStyle: GoogleFonts.kanit(
                  textStyle: TextStyle(color: Colors.black38, fontSize: 14.0),
                ),
              ),
              validator: re_validatePassword,
              controller: re_pass,
              onChanged: (val) {
                setState(() {
                  _repasswordRegister = val;
                });
              }),
        ),
      );

  Widget registerBtn({String btnname}) => Padding(
        padding: const EdgeInsets.only(
          left: 30.0,
          right: 30.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                width: ScreenUtil.getInstance().setWidth(180),
                height: ScreenUtil.getInstance().setHeight(200),
//                          Button => 'Register'
                child: RaisedButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(50.0),
                    side: BorderSide(color: Colors.lightBlue[300]),
                  ),
                  child: Text(
                    btnname,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  color: Colors.lightBlue[300],
                  onPressed: () async {
                    //Call Http Post Method
                    var register = Registeruser();
                    register.email = _emailRegister;
                    register.password = _passwordRegister;
                    register.id = _stuIdRegister;
                    print(register.email);
                    print(register.password);
                    print(register.id);
                    String jsonRegister = registeruserToJson(register);
                    print(jsonRegister);

                    String _postUrl =
                        'https://us-central1-newagent-47c20.cloudfunctions.net/api/user';
                    var response = await Http.post(
                      _postUrl,
                      headers: {
                        HttpHeaders.contentTypeHeader: 'application/json'
                      },
                      body: jsonRegister,
                    );
                    print("Status: " +
                        response.statusCode.toString() +
                        response.body);
                    if (response.statusCode == 201) {
                      if (formKeyRegister.currentState.validate()) {
                        formKeyRegister.currentState.save();
                        dynamic result =
                            await _authService.registerWithEmailAndPassword(
                                _emailRegister, _passwordRegister);
                        if (result == null) {
                          setState(
                            () {
                              error = "please supply a valid email";
                              isRegister = false;
                            },
                          );
                        } else {
                          print('else result not Null');
                          setState(
                            () {
                              isRegister = true;
                            },
                          );
                        }
                      }
                    } else {
                      print('else');
                      setState(
                        () {
                          isRegister = false;
                          print(response.statusCode.toString());
                        },
                      );
                    }

                    (isRegister) ? _showDialogS() : Container();
                  },
                  elevation: 5,
                ),
              ),
            ),
          ],
        ),
      );

//  ****************************************************************************  //
// Dialog Show Register Successfully
  _showDialogS() {
    showDialog(
        context: context,
        builder: (_) => NetworkGiffyDialog(
              key: keys[1],
              image: Image.asset(
                'img/RegisSuccess.gif',
                fit: BoxFit.cover,
              ),
              entryAnimation: EntryAnimation.BOTTOM,
              title: Text(
                'Successfully!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
              ),
              description: Text(
                'สมัครสมาชิกสำเร็จ กรุณาทำการเข้าสู่ระบบ',
                textAlign: TextAlign.center,
                style: GoogleFonts.kanit(
                  textStyle: TextStyle(color: Colors.black38, fontSize: 14.0),
                ),
              ),
              onOkButtonPressed: () {
                Navigator.pushNamed(context, '/Login-page');
              },
              onlyOkButton: true,
            ));
  }

//  ******************** Validate condition ********************
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  String validateStudentId(String value) {
    if (value.isEmpty) {
      return "Please input Password";
    } else {
      if (value.length < 13) {
        return "Please Input Password 6 Character";
      }
    }
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return "Please input Password";
    } else {
      if (value.length < 6) {
        return "Please Input Password 6 Character";
      }
    }
  }

  String re_validatePassword(String value) {
    // ignore: unrelated_type_equality_checks
    if (_repasswordRegister != _passwordRegister) {
      return "Please re-input Password";
    }
  }

//  *********************************************************************** //

}
