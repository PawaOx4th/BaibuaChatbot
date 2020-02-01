import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Group extends StatefulWidget {
  @override
  _GroupState createState() => _GroupState();
}

class _GroupState extends State<Group> {
  //Variable
  final bool isWork = true;
  final bool isWorkDeadline = true;
  String iD = '';
  String _countWorking = "2";
  String _countWorkDeadline = "20";
  List newsData;
  int indexS;
  var pictureDemo =
      "https://images.unsplash.com/photo-1523240795612-9a054b0db644?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80";

  //TextStyle
  TextStyle _googleFontKaniTitle = GoogleFonts.kanit(
    fontSize: 22.0,
    fontWeight: FontWeight.w500,
    textStyle: TextStyle(
      color: Color.fromRGBO(0, 147, 233, 1),
    ),
  );

  TextStyle _googleFontKanit = GoogleFonts.kanit(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    textStyle: TextStyle(color: Colors.white, height: 1.2),
  );

  TextStyle _dateFontKanit = GoogleFonts.kanit(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    textStyle: TextStyle(color: Colors.white),
  );

  TextStyle _typeFontKanit = GoogleFonts.kanit(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    textStyle: TextStyle(color: Colors.grey[300]),
  );

  TextStyle _countwork =
      TextStyle(color: Colors.white70, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(appBar: customsAppBar(), body: GroupSubject()));
  }

  //***********************************************************************//
  //~ Widget
  Widget customsAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(80),
      child: Column(
        children: <Widget>[
          AppBar(
            // title: titleAppbar(),
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
                child: Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //Working
                      Padding(
                        padding: EdgeInsets.only(left: 25.0),
                        child: Stack(
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
                      ),

                      //Name App BAr
                      titleAppbar(),

                      //Notification
                      Container(
                        child: Wrap(
                          children: <Widget>[
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
                            Stack(
                              children: <Widget>[
                                IconButton(
                                  tooltip: "เพิ่มกลุ่ม",
                                  icon: Icon(
                                    Icons.queue,
                                    color: Color.fromRGBO(166, 188, 208, 1),
                                    size: 28,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SizedBox(
          width: 5,
        ),
        Text(
          "กลุ่ม",
          style: _googleFontKaniTitle,
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

//todo Class Group Subject  Return Subjects..
class GroupSubject extends StatefulWidget {
  @override
  _GroupSubjectState createState() => _GroupSubjectState();
}

class _GroupSubjectState extends State<GroupSubject> {
  //? Key
  Key _singleChildScroll, _mainColumn;

  //? Variable
  ////Colors
  List cardColor = [
    Color.fromRGBO(60, 73, 92, 1).withOpacity(0.6), //Background Black
    Color.fromRGBO(0, 147, 233, 1).withOpacity(0.6), // Background Blue
    Color.fromRGBO(116, 138, 157, 1).withOpacity(0.6), // Background Gray
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: _singleChildScroll,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          key: _mainColumn,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,

              //! Build Call Data With REST API..
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Card(
                        color: Colors.black26,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          height: 160,
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
