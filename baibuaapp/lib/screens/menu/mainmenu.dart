// import 'dart:js';

import 'dart:convert';

import 'package:baibuaapp/Widgets/customAppBar.dart';
import 'package:baibuaapp/Widgets/notificationAlert.dart';
import 'package:http/http.dart' as Http;

import 'package:baibuaapp/REST%20API/fatchWorkCount.dart';
import 'package:baibuaapp/models/statWorkCount.dart';
import 'package:baibuaapp/Screens/menu/map.dart';
import 'package:baibuaapp/models/userdata.dart';
import 'package:baibuaapp/screens/Authenticate/autu.dart';
import 'package:baibuaapp/screens/Bottomnavigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Mainmenu extends StatefulWidget {
  @override
  _MainmenuState createState() => _MainmenuState();
}

class _MainmenuState extends State<Mainmenu> {
  //Variable
  final bool isWork = false;
  final bool isWorkDeadline = false;

  int userLavel;

  TextStyle _textMenu = GoogleFonts.roboto(
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    textStyle: TextStyle(color: Colors.white),
  );

  TextStyle _textMenuTH = GoogleFonts.kanit(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    textStyle: TextStyle(color: Colors.white),
  );

  //Color All
  Color iconColor = Color.fromRGBO(173, 197, 219, 1);
  Color bgMenuColor = Color.fromRGBO(0, 147, 233, 1);
  Color shadowMenuColor = Color.fromRGBO(11, 84, 194, 0.5);

  Future<void> findDisplay() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    String name = firebaseUser.displayName;

    findLavel(userID: name);

    print("Displayname In Main Menu Page => " + name);
  }

  Future<void> findLavel({String userID}) async {
    var url =
        "https://us-central1-newagent-47c20.cloudfunctions.net/api/user/filterId/$userID";
    var response = await Http.get(url);
    Map map = jsonDecode(response.body);
    Userdata userData = Userdata.fromJson(map);
    setState(() {
      userLavel = userData.level;
    });
  }

  //Init State
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findDisplay();
    WorkOfCount.fetchConut();
    // findLavel();
  }

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    double _widthScreen = MediaQuery.of(context).size.width;
    String userId = ModalRoute.of(context).settings.arguments;

    return ChangeNotifierProvider(
      create: (_) => WorkCount(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Column(
            children: <Widget>[CustomAppBarr("เมนู")],
          ),
        ),
        body: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //************************Line1 ********************************//
                Container(
                  width: _widthScreen,
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      //******************** Baibua Chatroom ********************//
                      Container(
                        width: 147,
                        height: 145,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: bgMenuColor,
                          boxShadow: [
                            BoxShadow(
                                color: shadowMenuColor,
                                offset: Offset(0, 5),
//                            spreadRadius: 5,
                                blurRadius: 5)
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/Chatroom-page');
                          },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 60,
                                  height: 60,
                                  child: Icon(
                                    Icons.forum,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Baibua Chat",
                                  style: _textMenu,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      //*********************** Detail **************************//
                      Container(
                        width: 147,
                        height: 145,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: bgMenuColor,
                          boxShadow: [
                            BoxShadow(
                                color: shadowMenuColor,
                                offset: Offset(0, 5),
//                            spreadRadius: 5,
                                blurRadius: 5)
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            // Navigator.pushNamed(context, '/Userdetail-page');
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BottomNavigation(
                                page: 2,
                              ),
                            ));
                          },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 60,
                                  height: 60,
                                  child: Icon(
                                    Icons.account_box,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "ข้อมูลส่วนตัว",
                                  style: _textMenuTH,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20.0,
                ),
                //************************ Line2 ********************************//
                Container(
                  width: _widthScreen,
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      //************************ News **************************//
                      Container(
                        width: 147,
                        height: 145,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: bgMenuColor,
                          boxShadow: [
                            BoxShadow(
                                color: shadowMenuColor,
                                offset: Offset(0, 5),
//                            spreadRadius: 5,
                                blurRadius: 5)
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            // Navigator.pushNamed(context, '/Newevent-page');
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BottomNavigation(
                                page: 0,
                              ),
                            ));
                          },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 60,
                                  height: 60,
                                  child: Icon(
                                    Icons.library_books,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "ข่าวสาร",
                                  style: _textMenuTH,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      //************************ Group **************************//
                      Container(
                        width: 147,
                        height: 145,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: bgMenuColor,
                          boxShadow: [
                            BoxShadow(
                                color: shadowMenuColor,
                                offset: Offset(0, 5),
//                            spreadRadius: 5,
                                blurRadius: 5)
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BottomNavigation(
                                page: 1,
                              ),
                            ));
                          },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 60,
                                  height: 60,
                                  child: Icon(
                                    Icons.people,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "กลุ่ม",
                                  style: _textMenuTH,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                //************************ Line3 ********************************//
                Container(
                  width: _widthScreen,
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      //************************ Map **************************//
                      Container(
                        width: 147,
                        height: 145,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: bgMenuColor,
                          boxShadow: [
                            BoxShadow(
                                color: shadowMenuColor,
                                offset: Offset(0, 5),
//                            spreadRadius: 5,
                                blurRadius: 5)
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            //  Navigator.pushNamed(context, '/Chatroom-page');
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MapRoom()));
                          },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 60,
                                  height: 60,
                                  child: Icon(
                                    Icons.map,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "แผนที่",
                                  style: _textMenuTH,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      //************************ Setting ************************//
                      Container(
                        width: 147,
                        height: 145,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: bgMenuColor,
                          boxShadow: [
                            BoxShadow(
                                color: shadowMenuColor,
                                offset: Offset(0, 5),
//                            spreadRadius: 5,
                                blurRadius: 5)
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/setting');
                          },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 60,
                                  height: 60,
                                  child: Icon(
                                    Icons.settings_applications,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "ตั้งค่า",
                                  style: _textMenuTH,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
