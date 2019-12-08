import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

//  Validate Variable
  final formKeyRegister = GlobalKey<FormState>();

//  Variable  form  Email Input, Student-id Input and Password Input
  String _emailRegister, _stuIdRegister, _passwordRegister ;


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
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 80,
                        child: Image.asset('img/user.png'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Form(
                        child: Column(
                          children: <Widget>[
                            emailInput(),
                            SizedBox(
                              height: 16,
                            ),
                            studentIdInput(),
                            SizedBox(
                              height: 16,
                            ),
                            passwordInput(),
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

  Widget emailInput() => Container(
        padding: EdgeInsets.all(05),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "E-mail",
              prefixIcon: Icon(Icons.email),
              border: InputBorder.none,
              hintStyle: TextStyle(fontSize: 14.0, color: Colors.black38),
            ),
            //** Validator ID
            validator: validateEmail,
          ),
        ),
      );

  Widget studentIdInput() => Container(
        padding: EdgeInsets.all(05),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextFormField(
            maxLength: 13,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Student ID",
              prefixIcon: Icon(Icons.perm_contact_calendar),
              border: InputBorder.none,
              hintStyle: TextStyle(fontSize: 14.0, color: Colors.black38),
            ),
            //** Validator ID
            validator: validateStudentId,
          ),
        ),
      );

  Widget passwordInput() => Container(
        padding: EdgeInsets.all(05),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextFormField(
            maxLength: 6,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Password",
              prefixIcon: Icon(Icons.vpn_key),
              border: InputBorder.none,
              hintStyle: TextStyle(fontSize: 14.0, color: Colors.black38),
            ),
            //** Validator ID
            validator:validatePassword,
          ),
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

  String validateStudentId(String value){
    if (value.isEmpty) {
      return "Please input Password";
    } else {
      if (value.length < 14) {
        return "Please Input Password 6 Character";
      }
    }

  }

  String validatePassword(String value){
    if (value.isEmpty) {
      return "Please input Password";
    } else {
      if (value.length < 6) {
        return "Please Input Password 6 Character";
      }
    }

  }
//  ****************************************************************************  //

//  ****************************************************************************  //

}
