import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _id =  new TextEditingController(); // มี new  หรือ ไม่มีก็ได้ หรือใช้ "var" แทน TextEditingController ก็ได้
  var _password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 80,
                  child: Image.asset("img/logo.png"),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          Container(
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
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "ID",
                                  prefixIcon: Icon(Icons.people),
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                                controller: _id, // binding data
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 18.0,
                          ),
                          Container(
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
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  prefixIcon: Icon(Icons.vpn_key),
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                                controller: _password,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
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
                              "Register",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                            color: Colors.green,
                            onPressed: () {
                              print(_id.text);
                              Navigator.pushNamed(
                                context,
                                '/emty-page',
                                arguments: [ _id.text, _password.text],
                              );
                              setState(
                                () {
                                  _id.text = "";
                                  _password.text = "";// Clear Textfile ID
                                },
                              );
                            },
                            elevation: 5,
                          ),
                        ),
                      ),
//                    Container(
//                      width: 130.0,
//                      height: 50.0,
//                      child: RaisedButton(
//                        shape: new RoundedRectangleBorder(
//                          borderRadius: new BorderRadius.circular(18.0),
//                          side: BorderSide(color: Colors.red),
//                        ),
//                        child: Text(
//                          "Login",
//                          style: TextStyle(
//                            color: Colors.white,
//                            fontSize: 18.0,
//                          ),
//                        ),
//                        color: Colors.red,
//                        onPressed: () {},
//                        elevation: 5,
//                      ),
//                    ),
                    ],
                  ),
                ),
                FlatButton(onPressed: () {}, child: Text("Forgot password")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
