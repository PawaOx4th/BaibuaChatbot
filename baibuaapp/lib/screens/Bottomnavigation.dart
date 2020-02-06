import 'package:baibuaapp/Screens/menu/group/group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'menu/mainmenu.dart';
import 'package:baibuaapp/Screens/menu/group/addGroup.dart';
import 'package:baibuaapp/screens/menu/baibuaChatroom.dart';
import 'package:baibuaapp/screens/menu/map.dart';
import 'package:baibuaapp/screens/menu/news/Newevent.dart';
import 'package:baibuaapp/screens/menu/userdetail.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({
    Key key,
    // this.UserID,
    this.page,
  }) : super(key: key);

  // String UserID;
  int page;

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectpage;

  // Color iconColor = Color.fromRGBO(166, 188, 208, 1);
  Color iconColor = Colors.white;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectpage = widget.page;
  }

  final NewEvent newEvent = NewEvent();
  final Group group = Group();
  final UserDetailPage userDetailPage = UserDetailPage();
  final Map map = Map();
  final Mainmenu mainmenu = Mainmenu();
  final ChatroomBaibua chatroomBaibua = ChatroomBaibua();

  //* *******************************
  Widget _showPage = UserDetailPage();

  Widget _pageChooser(int selectpage) {
    switch (selectpage) {
      case 0:
        return newEvent;
      case 1:
        return Group();
      case 2:
        return UserDetailPage();
      case 3:
        return map;
      case 4:
        // return AddGroup();
        return mainmenu;
        // case 5:
        //   return userDetailPage;
        break;
    }
  }

  GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
//    String userID = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _pageChooser(selectpage),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 300),
        index: selectpage,
        key: _bottomNavigationKey,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.blue,
        color: Colors.blue,
        items: <Widget>[
          Icon(
            Icons.library_books,
            size: 30,
            color: iconColor,
          ),
          Icon(
            Icons.group,
            size: 30,
            color: iconColor,
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Chatroom-page');
              print("Go to Chatroom");
            },
            icon: Icon(
              Icons.message,
              color: iconColor,
            ),
          ),
          Icon(
            Icons.map,
            size: 30,
            color: iconColor,
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Mainmenu-page');
              print("Go to Chatroom");
            },
            icon: Icon(
              Icons.home,
              size: 30,
              color: iconColor,
            ),
          ),
        ],
        onTap: (index) {
          //Handle button tap
          setState(() {
            selectpage = index;
            print(index.toString());
          });
        },
      ),
    );
  }
}
