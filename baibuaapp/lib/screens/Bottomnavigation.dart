import 'package:baibuaapp/screens/menu/baibuaChatroom.dart';
import 'package:baibuaapp/screens/menu/userdetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'menu/mainmenu.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({
    Key key,
    this.UserID,
  }) : super(key: key);

  String UserID;

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedPage = 0;

  final _pageOptions = [
    UserDetailPage(),
    ChatroomBaibua(),
    Mainmenu() ,
  ];


  @override
  Widget build(BuildContext context) {
//    String userID = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _pageOptions[_selectedPage],
          Positioned(
            child: bottomNavigationBar,
            bottom: 0,
            left: 0,
            right: 0,
          ),
        ],
      ),
    );
  }

  Widget get bottomNavigationBar {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedPage,
        onTap: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            title: Text("Box"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Box"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            title: Text("Box"),
          ),
        ],
      ),
    );
  }
}
