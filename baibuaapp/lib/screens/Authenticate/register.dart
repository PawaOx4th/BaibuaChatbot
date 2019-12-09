import 'package:baibuaapp/screens/Authenticate/autu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
//  Validate Variable
  final formKeyRegister = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

//  Variable  form  Email Input, Student-id Input and Password Input
  String _stuIdRegister, _emailRegister, _passwordRegister;

//
  String error = '';

//  TextController
  TextEditingController stuId, email, pass;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
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
                      CircleAvatar(
                        radius: 60,
                        child: Image.asset('img/user.png'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Form(
                        key: formKeyRegister,
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 36.0, bottom: 10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.white),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Text(
                                      "Register",
                                      style: TextStyle(
                                        color: Colors.cyanAccent[700],
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  studentIdInput(),
                                  emailInput(),
                                  Text(error,
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 14.0),),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  passwordInput(),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  re_passwordInput(),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  registerBtn(btnname: "Register Now"),
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

  Widget studentIdInput() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.00, horizontal: 18),
      child: TextFormField(
        maxLength: 13,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: "Student ID",
          prefixIcon: Icon(Icons.perm_contact_calendar),
//              border: InputBorder.none,
          hintStyle: TextStyle(fontSize: 14.0, color: Colors.black38),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.cyan[100], width: 2),
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
      ));

  Widget emailInput() => Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 18),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "E-mail",
            prefixIcon: Icon(Icons.email),
//            border: InputBorder.none,
            hintStyle: TextStyle(fontSize: 14.0, color: Colors.black38),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.cyan[100], width: 2),
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
      );

  Widget passwordInput() => Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 18),
        child: TextFormField(
            maxLength: 6,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Password",
              prefixIcon: Icon(Icons.vpn_key),
//            border: InputBorder.none,
              hintStyle: TextStyle(fontSize: 16.0, color: Colors.black38),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan[100], width: 2),
              ),
            ),
            validator: validatePassword,
            controller: pass,
            onChanged: (val) {
              setState(() {
                _passwordRegister = val;
              });
            }),
      );

  Widget re_passwordInput() => Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 18),
        child: TextFormField(
            maxLength: 6,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "re-password",
              prefixIcon: Icon(Icons.vpn_key),
//            border: InputBorder.none,
              hintStyle: TextStyle(fontSize: 16.0, color: Colors.black38),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan[100], width: 2),
              ),
            ),
            validator: re_validatePassword,
            controller: pass,
            onChanged: (val) {
              setState(() {
                _passwordRegister = val;
              });
            }),
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
//                      width: 200.0,
                height: 50.0,
//                          Button => 'Register'
                child: RaisedButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
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
//                    print("stuId : $_stuIdRegister");
//                    print("email : $_emailRegister");
//                    print("password : $_passwordRegister");
//                    Navigator.push(context,
//                        MaterialPageRoute(builder: (context) => Register()));
//                    if (formKey.currentState.validate()) {
//                      formKey.currentState.save();
////                      print(_id.text);
////                      print(_pass.text);
//                      // Call _authService function
//                      dynamic result = await _authService.signInAnon();
//                      if (result == null) {
//                        print('error Signing in');
//                      } else {
//                        print('Signed in');
//                        Navigator.pushNamed(context, "/emty-page");
//                        print(result.uid);
//                      }
//                    }
                    if (formKeyRegister.currentState.validate()) {
                      formKeyRegister.currentState.save();
                      dynamic result =
                          await _authService.registerWithEmailAndPassword(
                              _emailRegister, _passwordRegister);
                      if (result == null) {
                        setState(() {
                          error = "please supply a valid email";
                        });
                      } else {
                        Navigator.pushNamed(context, '/emty-page');
                      }
                    }
                  },
                  elevation: 5,
                ),
              ),
            ),
          ],
        ),
      );

//  ****************************************************************************  //
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
    if (value == pass) {
      return "Please re-input Password";
    }
  }
//  ****************************************************************************  //

//  ****************************************************************************  //

}
