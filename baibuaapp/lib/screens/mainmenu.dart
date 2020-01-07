import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mainmenu extends StatefulWidget {
  @override
  _MainmenuState createState() => _MainmenuState();
}

class _MainmenuState extends State<Mainmenu> {
  //Variable
  final bool isWork = false;
  final bool isWorkDeadline = false;
  String _countWorking = "2";
  String _countWorkDeadline = "20";

  //TextStyle
  TextStyle _googleFontRoboto = GoogleFonts.roboto(
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    textStyle: TextStyle(color: Color.fromRGBO(0, 147, 233, 1)),
  );

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

  TextStyle _countwork =
      TextStyle(color: Colors.white70, fontWeight: FontWeight.bold);

  //Color All
  Color iconColor = Color.fromRGBO(173, 197, 219, 1);
  Color bgMenuColor = Color.fromRGBO(0, 147, 233, 1);
  Color ShadowMenuColor = Color.fromRGBO(11, 84, 194, 0.5);

  //Init State
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Column(
          children: <Widget>[
            AppBar(
              title: titleAppbar(),
//        leading: null,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(25))),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Row(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.assignment_late,
                              color: Color.fromRGBO(166, 188, 208, 1),
                              size: 28,
                            ),
                            onPressed: () {},
                          ),
                          isWork ? working() : Container(),
                        ],
                      ),
                      SizedBox(
                        width: 2.00,
                      ),
                      Stack(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.notification_important,
                              color: Color.fromRGBO(166, 188, 208, 1),
                              size: 28,
                            ),
                            onPressed: () {},
                          ),
                          isWorkDeadline ? workDeadline() : Container(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Stack(
//        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: _widthScreen,
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 147,
                      height: 145,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: bgMenuColor,
                        boxShadow: [
                          BoxShadow(
                              color: ShadowMenuColor,
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
                    Container(
                      width: 147,
                      height: 145,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: bgMenuColor,
                        boxShadow: [
                          BoxShadow(
                              color: ShadowMenuColor,
                              offset: Offset(0, 5),
//                            spreadRadius: 5,
                              blurRadius: 5)
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          print("Tap");
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
              Container(
                width: _widthScreen,
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 147,
                      height: 145,
                      child: Placeholder(),
                    ),
                    Container(
                      width: 147,
                      height: 145,
                      child: Placeholder(),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: _widthScreen,
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 147,
                      height: 145,
                      child: Placeholder(),
                    ),
                    Container(
                      width: 147,
                      height: 145,
                      child: Placeholder(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget App Name
  Widget titleAppbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          Icons.track_changes,
          color: Colors.blue,
          size: 32,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "Baibua",
          style: _googleFontRoboto,
        ),
      ],
    );
  }

  //Widget Count Working
  Widget working() {
    return Positioned(
      bottom: 5,
      left: 3,
      child: Container(
        alignment: Alignment.center,
        width: 22,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Text(
          _countWorking,
          style: _countwork,
        ),
      ),
    );
  }

  //Widget  work Deadline
  Widget workDeadline() {
    return Positioned(
      bottom: 5,
      left: 3,
      child: Container(
        alignment: Alignment.center,
        width: 22,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Text(
          _countWorkDeadline,
          style: _countwork,
        ),
      ),
    );
  }

//
}