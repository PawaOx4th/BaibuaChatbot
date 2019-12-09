import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:baibuaapp/screens/Authenticate/register.dart';
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
    return SafeArea(
      child: Scaffold(
//        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.lightBlueAccent,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 80,
                      child: Image.asset("img/logo.png"),
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(30),
                            child: Column(
                              children: <Widget>[
                                idInput(),
                                SizedBox(height: 18.0),
                                passwordInput(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                    loginBtn(),
                    buttonBottom(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //**************************************************************************//
  // Note : Widget ID  TextFormFeild
  Widget idInput() => Container(
        padding: EdgeInsets.all(10),
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
            onChanged: (val) {
              setState(() => _email = val);
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "E-mail",
              prefixIcon: Icon(Icons.people),
              border: InputBorder.none,
              hintStyle: TextStyle(
                fontSize: 18.0,
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
        padding: EdgeInsets.all(10),
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
            onChanged: (val) {
              setState(() => _password = val);
            },
            decoration: InputDecoration(
              hintText: "Password",
              prefixIcon: Icon(Icons.vpn_key),
              border: InputBorder.none,
              hintStyle: TextStyle(
                fontSize: 18.0,
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
            Expanded(
              child: Container(
//                      width: 200.0,
                height: 50.0,
//                          Button => 'Register'
                child: RaisedButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.green),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  color: Colors.green,
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
                      }else{
                        Navigator.pushNamed(context, '/Chatroom-page');
                      }
                      // Call _authService function

                    }
                  },
                  elevation: 5,
                ),
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
//                    fontFamily: 'FC Knomphing',
                  ),
                ),
              ),
            ],
          ),
        ),
      );
//**************************************************************************//
}
