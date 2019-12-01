import 'dart:convert';
import 'Models/Login.dart';

import 'package:flutter/material.dart';

class Emty_PageNavigation extends StatefulWidget {
  @override
  _Emty_PageNavigationState createState() => _Emty_PageNavigationState();
}

class _Emty_PageNavigationState extends State<Emty_PageNavigation> {
  final String nameTab = "Tranning_01";

  List<String> _list = ['XXX', 'YYY', 'ZZZ'];

  @override
  Widget build(BuildContext context) {

    List<String> _data = ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Title(
            color: Colors.blue,
            child: Text(nameTab),
          ),
        ),
        body: SafeArea(
//          child: Column(
//            children: _list.where((element) => element != 'YYY').map(
//              (element) {
//                return Text(element);
//              },
//            ).toList(),
//          ),
          child: RaisedButton(
            onPressed: () {
//              Json Basic
              //              user['username'] = 'admin';
              //              user['password'] = '1234';
              //              print(user);
              //              String Json = json.encode(user);
              //              print(Json);

//            Medal Class
//              print(_data);
              var login = Login();
              login.username =  _data[0];
              login.password = _data[1];
//              print(login.username);
              String loginStr = loginToJson(login);
              print(loginStr);
            },
            child: Text("OK"),
          ),
        ),
      ),
    );
  }
}
