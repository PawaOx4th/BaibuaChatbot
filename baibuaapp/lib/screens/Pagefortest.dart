import 'package:baibuaapp/api/apitest.dart';
import 'package:baibuaapp/models/Apitestmodel.dart';
import 'package:baibuaapp/screens/Authenticate/Login.dart';
import 'package:baibuaapp/screens/Authenticate/Autu.dart';
import 'package:flutter/material.dart';

class Pagefortest extends StatefulWidget {
  @override
  _PagefortestState createState() => _PagefortestState();
}

// ignore: camel_case_types
class _PagefortestState extends State<Pagefortest> {
  final String nameTab = "Main Screen";
  final AuthService _authService = AuthService();

  List<Apitestmodel> list = List();

 
//  List<String> _list = ['XXX', 'YYY', 'ZZZ'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: Text(nameTab),
          backgroundColor: Colors.lightBlueAccent,
          elevation: 5,
          actions: <Widget>[
//           Logout Button
            FlatButton.icon(
              icon: Icon(
                Icons.person,
              ),
              label: Text('Logout'),
              onPressed: () async {
                await _authService.signOut(); // Method Log Out
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                testapi().test();
                onPressed: _fetchData,
              },
            ),
            ListView.builder(
              itemCount: list.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  contentPadding: EdgeInsets.all(10.0),
                  title: Text(list[index].userId),
                  subtitle: Text(list[index].userLname),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
