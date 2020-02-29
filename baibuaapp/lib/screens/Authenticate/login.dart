import 'package:baibuaapp/models/userdata.dart';
import 'package:baibuaapp/screens/menu/baibuaChatroom.dart';
import 'package:baibuaapp/sizeConfig.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:baibuaapp/screens/Authenticate/register.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'autu.dart';
import 'dart:convert';
import 'package:http/http.dart' as Http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //  ****************************************************** //
  // Call AuthService =>  autu.dart
  final AuthService _authService = AuthService();
  String error = '';

  //  ****************************************************** //
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String _email, _password;
  String userId;

  // มี new  หรือ ไม่มีก็ได้ หรือใช้ "var" แทน TextEditingController ก็ได้
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  static const List<Key> keys = [
    Key("Network"),
    Key("NetworkDialog"),
    Key("Flare"),
    Key("FlareDialog"),
    Key("Asset"),
    Key("AssetDialog")
  ];

  //Size

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: scaffoldKey,
//        resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 0.1),
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 10.0),
                    height: MediaQuery.of(context).size.height - 80,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(40)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10.0,
                            spreadRadius: 1,
                            offset: Offset(0, 5))
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: 130.0,
                          height: 130.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.5),
                                blurRadius: 10.0,
                                spreadRadius: 0.5,
                                offset: Offset(1.0, 1.0),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                child: Icon(
                                  Icons.track_changes,
                                  color: Colors.white,
                                  size: 50,
                                ),
                                backgroundColor: Colors.blue,
                                radius: 35,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Baibua",
                                style: GoogleFonts.roboto(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  textStyle: TextStyle(
                                      color: Color.fromRGBO(0, 148, 233, 1)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Form(
                          key: formKey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(30),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Sign in",
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24.0,
                                        textStyle: TextStyle(
                                          color:
                                              Color.fromRGBO(166, 188, 208, 1),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    idInput(),
                                    SizedBox(height: 18.0),
                                    passwordInput(),
                                    SizedBox(height: 10.0),
                                    InkWell(
                                      onTap: () {
                                        print("Click Forgot password");
                                      },
                                      child: Text(
                                        "Forgot password?",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color:
                                              Color.fromRGBO(166, 188, 208, 1),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 16.0),
                                    Text(
                                      error,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 16),
                                    ),
                                    SizedBox(height: 50.0),
                                    loginBtn(context),
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
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: Text(
                    "CREATE ACCOUNT",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      textStyle: TextStyle(
                        color: Color.fromRGBO(166, 188, 208, 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      _checkLogin();
    }
  }

  void perfomLogin() {
    SnackBar snackBer = SnackBar(
      backgroundColor: Colors.blueAccent,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Email: ${_emailController.text}",
          ),
          CircleAvatar(
            maxRadius: 8,
            backgroundColor: Colors.greenAccent,
          )
        ],
      ),
    );
    scaffoldKey.currentState.showSnackBar(snackBer);
  }

  void _checkLogin() async {
    var url =
        "https://us-central1-newagent-47c20.cloudfunctions.net/api/user/filterEm/${_email}";
    var response = await Http.get(url);
    Map map = jsonDecode(response.body);
    Userdata userData = Userdata.fromJson(map);
    print(_emailController.text);

    // (response.body == null) ? print("true") : print("False");

    if (response.statusCode == 200) {
      perfomLogin();

      dynamic result = await _authService.loginWithEmailAndPassword(
          _emailController.text, _passwordController.text);

      if (result == null) {
        print("Result Null");
        print(result.toString());
        _showDialog(context);
      } else {
        final FirebaseUser user = await FirebaseAuth.instance.currentUser();
        final String uid = user.uid.toString();
        setState(() {
          userId = userData.id;
        });
        setUpDisplayName(userID: userId);

        MaterialPageRoute materialPageRoute = MaterialPageRoute(
            builder: (BuildContext context) => ChatroomBaibua());
        Navigator.of(context).pushAndRemoveUntil(
            materialPageRoute, (Route<dynamic> route) => false);
        // print("Get data With Email: ${userData.email}");
        // print("Result NotNull: ${uid}");
      }
    } else {
      print(response.statusCode.toString());
      _showDialogSERROR();
    }

    //
  }

  // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Widget Section !!!!!!!!!!!!!!!!!!!!!!!!!!
  //**************************************************************************//
  // Note : Widget ID  TextFormFeild
  Widget idInput() => Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Color.fromRGBO(240, 244, 248, 1),
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextFormField(
            // onChanged: (val) {
            //   setState(() => _email = val.trim());
            // },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(
                Icons.mail,
                color: Color.fromRGBO(166, 188, 208, 1),
              ),
              border: InputBorder.none,
              hintStyle: TextStyle(
                  fontSize: 16.0, color: Color.fromRGBO(166, 188, 208, 1)),
            ),
            controller: _emailController,
            //** Validator Email
            // validator: (val) => !val.contains('@') ? 'Invalid Email' : null,
            onSaved: (val) => _email = val.trim(),
            validator: (String value) {
              if (value.isEmpty) {
                return "Invalid Email Format";
              } else {
                if (value.contains("@") && value.contains(".com")) {
                  return null;
                } else {
                  return "Please Email Format";
                }
              }
            },
          ),
        ),
      );

  //**************************************************************************//
  // Note : Widget Password TextFeild
  Widget passwordInput() => Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Color.fromRGBO(240, 244, 248, 1),
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextFormField(
            onSaved: (val) => _password,
            obscureText: true,
            maxLength: 6,
            keyboardType: TextInputType.number,
            // onChanged: (val) {
            //   setState(() => _password = val.trim());
            // },
            decoration: InputDecoration(
              counterText: "",
              counterStyle: TextStyle(
                height: double.minPositive,
              ),
              hintText: "Password",
              prefixIcon:
                  Icon(Icons.lock, color: Color.fromRGBO(166, 188, 208, 1)),
              border: InputBorder.none,
              hintStyle: TextStyle(
                  fontSize: 18.0, color: Color.fromRGBO(166, 188, 208, 1)),
            ),
            controller: _passwordController,

            //** Validator ID
            // ignore: missing_return
            validator: (value) {
              if (value.isEmpty) {
                return "Please input Password";
              } else {
                if (value.length < 6) {
                  return "Please Input Password 6 Character";
                }
              }
            },
          ),
        ),
      );

  //**************************************************************************//
  // Note : Widget Login Button TextFeild
  Widget loginBtn(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          left: 1.0,
          right: 1.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 65 * SizeConfig.widthMultiplier,
              // width: MediaQuery.of(context).size.height * 0.3,
              height: 60,
              child: RaisedButton(
                color: Color.fromRGBO(0, 147, 233, 1),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(50.0),
                ),
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // ************************************
                onPressed: _submit,
                // ************************************

                // onPressed: () async {

                elevation: 5,
              ),
            ),
          ],
        ),
      );

  //**************************************************************************//
  // Note : Alert Dialog
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Login Fail"),
          content: Text(
              "The email or password is Invalid or the User does not have a  email or password"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop("Discard");
              },
              child: Text(
                "Yes",
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        );
      },
    );
  }

//! Dialog Error ...
  void _showDialogSERROR() {
    showDialog(
      context: context,
      builder: (_) => NetworkGiffyDialog(
        key: keys[1],
        image: Image.asset(
          'img/error.gif',
          fit: BoxFit.cover,
        ),
        entryAnimation: EntryAnimation.BOTTOM,
        title: Text(
          'Failed to Login ',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        description: Text(
          'เข้าสู่ระบบไม่สำเร็จ \n กรุณาตรวจสอบ email  \n และรหัสผ่าน หรือติดต่อเจ้าหน้าที่',
          textAlign: TextAlign.center,
          style: GoogleFonts.kanit(
            textStyle: TextStyle(color: Colors.black38, fontSize: 16.0),
          ),
        ),
        onOkButtonPressed: () {
          Navigator.pop(context);
        },
        onlyOkButton: true,
        buttonOkColor: Colors.red,
      ),
    );
  }

  callDataWithEmail({String email}) async {
    print("=> : " + email);
    var url =
        "https://us-central1-newagent-47c20.cloudfunctions.net/api/user/filterEm/$email";
    var response = await Http.get(url);
    Map map = jsonDecode(response.body);
    Userdata userData = Userdata.fromJson(map);
    print("Get data With Email: ${userData.email}");
    setState(() {
      userId = userData.id;
    });
  }

  //Setup Display Name with USER ID
  Future<void> setUpDisplayName({String userID}) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.currentUser().then((response) {
      UserUpdateInfo userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.displayName = userID;
      response.updateProfile(userUpdateInfo);
      print("UserUpdateInfo: ${userUpdateInfo.displayName}");
    });
  }

  //**************************************************************************//
  // Note : Widget ButtonBottom TextFeild
  Widget buttonBottom(BuildContext context) => Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                onPressed: () {},
                child: Text(
                  "Forgot password",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
                },
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  //**************************************************************************//
  // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Widget Section !!!!!!!!!!!!!!!!!!!!!!!!!!
}
