import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewEvent extends StatefulWidget {
  @override
  _NewEventState createState() => _NewEventState();
}

class _NewEventState extends State<NewEvent> {


  //Variable
  final bool isWork = true;
  final bool isWorkDeadline = false;
  String iD = '';

  String _countWorking = "2";
  String _countWorkDeadline = "20";

  //TextStyle
  TextStyle _googleFontRoboto = GoogleFonts.roboto(
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    textStyle: TextStyle(color: Color.fromRGBO(0, 147, 233, 1)),
  );

  TextStyle _googleFontKanit = GoogleFonts.kanit(
    fontSize: 22.0,
    fontWeight: FontWeight.w500,
    textStyle: TextStyle(color: Color.fromRGBO(0, 147, 233, 1)),
  );

  TextStyle _detailFontKanit = GoogleFonts.kanit(
    fontSize: 16.0,
    textStyle: TextStyle(color: Color.fromRGBO(81, 92, 111, 1)),
  );

  TextStyle _btnFontKanit = GoogleFonts.kanit(
    fontSize: 16.0,
    textStyle: TextStyle(color: Colors.white),
  );

  TextStyle _countwork =
  TextStyle(color: Colors.white70, fontWeight: FontWeight.bold);

  //Color All
  Color iconColor = Color.fromRGBO(173, 197, 219, 1);
  Color borderRole = Color.fromRGBO(0, 147, 233, 1);
  Color bgMenuColor = Color.fromRGBO(237, 242, 247, 1);
  Color ShadowMenuColor = Color.fromRGBO(11, 84, 194, 0.5);
  Color nameColor = Color.fromRGBO(81, 93, 111, 1);
  Color btnSendAdminColor = Color.fromRGBO(166, 188, 208, 1);
  Color btnLogOutColor = Color.fromRGBO(255, 105, 105, 1);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Column(
            children: <Widget>[
              AppBar(
                title: titleAppbar(),
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(25),
                  ),
                ),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Row(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.book,
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
                              tooltip: "",
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
        body: Container(),
      ),
    );
  }

  // Widget App Name
  Widget titleAppbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SizedBox(
          width: 5,
        ),
        Text(
          "ข้อมูลส่วนตัว",
          style: _googleFontKanit,
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
}
