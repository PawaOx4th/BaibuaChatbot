import 'package:baibuaapp/screens/Authenticate/Login.dart';
import 'package:baibuaapp/screens/Authenticate/autu.dart';
import 'package:flutter/material.dart';

class Emty_PageNavigation extends StatefulWidget {
  @override
  _Emty_PageNavigationState createState() => _Emty_PageNavigationState();
}

class _Emty_PageNavigationState extends State<Emty_PageNavigation> {
  final String nameTab = "Main Screen";
  final AuthService _authService = AuthService();

//  List<String> _list = ['XXX', 'YYY', 'ZZZ'];

  @override
  Widget build(BuildContext context) {
    String _ID = ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: Text(nameTab),
          backgroundColor: Colors.lightBlueAccent,
          elevation: 5,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  await _authService.signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                icon: Icon(
                  Icons.person,
                ),
                label: Text('Logout'))
          ],
        ),
      ),
    );

//    return SafeArea(
//      child: Scaffold(
//        appBar: AppBar(
//          title: Title(
//            color: Colors.blue,
//            child: Text(nameTab),
//          ),
//        ),
//        body: SafeArea(
//          child: Column(
//            children: _list.map((element) {
//              return Text(element);
//// test Breanches
////             Test 222
//            }).toList(),
//          ),
//        ),
//      ),
//    );
  }
}
