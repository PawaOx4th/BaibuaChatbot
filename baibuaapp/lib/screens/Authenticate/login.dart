import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:baibuaapp/screens/Authenticate/register.dart';
import 'package:google_fonts/google_fonts.dart';
import 'autu.dart';

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

  String _email, _password;

  // มี new  หรือ ไม่มีก็ได้ หรือใช้ "var" แทน TextEditingController ก็ได้
  TextEditingController _id = TextEditingController();
  TextEditingController _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    padding: EdgeInsets.only(top: 50.0),
                    height: MediaQuery.of(context).size.height - 120,
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
                                            color: Color.fromRGBO(
                                                166, 188, 208, 1),
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
                                            color: Color.fromRGBO(
                                                166, 188, 208, 1),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 70.0),
                                      Text(
                                        error,
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 16),
                                      ),
                                      loginBtn(),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                FlatButton(
                  onPressed: () {},
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
            onChanged: (val) {
              setState(() => _email = val);
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(Icons.mail,color: Color.fromRGBO(166, 188, 208, 1),),
              border: InputBorder.none,
              hintStyle: TextStyle(
                fontSize: 16.0,
                color: Color.fromRGBO(166, 188, 208, 1)
              ),
            ),
            controller: _id,
            //** Validator ID
            validator: (String value) {
              if (value.isEmpty) {
                return "Please Email Format";
              } else {
                if (value.contains("@") && value.contains(".com")) {
                  return null;
                }
              }
            },
          ),
        ),
      );

  //**************************************************************************//

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
//            maxLength: 6,
            keyboardType: TextInputType.number,
            onChanged: (val) {
              setState(() => _password = val);
            },
            decoration: InputDecoration(
              hintText: "Password",
              prefixIcon: Icon(Icons.lock,color: Color.fromRGBO(166, 188, 208, 1)),
              border: InputBorder.none,
              hintStyle: TextStyle(
                fontSize: 18.0,
                  color: Color.fromRGBO(166, 188, 208, 1)
              ),
            ),
            controller: _pass,

            //** Validator ID
            // ignore: missing_return
            validator: (String value) {
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

  //**************************************************************************//
  // Note : Widget Login Button TextFeild
  Widget loginBtn() => Padding(
        padding: const EdgeInsets.only(
          left: 30.0,
          right: 30.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 250.0,
              height: 60.0,
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
                onPressed: () async {
                  print(_email + ":" + _password);
                  if (formKey.currentState.validate()) {
                    formKey.currentState.save();
                    dynamic result = await _authService
                        .loginWithEmailAndPassword(_email, _password);
                    print(_id.text);
                    print(_pass.text);
                    if (result == null) {
                      setState(() {
                        error = 'please supply a valid email.';
                      });
                    } else {
                      Navigator.pushNamed(context, '/Chatroom-page');
                    }
                    // Call _authService function

                  }
                },
                elevation: 5,
              ),
            ),
          ],
        ),
      );

  //**************************************************************************//

  //**************************************************************************//
  // Note : Widget ButtonBottom TextFeild
  Widget buttonBottom() => Container(
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
}
