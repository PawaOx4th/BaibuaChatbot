import 'package:baibuaapp/Screens/menu/group/addGroup.dart';
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
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => AddGroup()));
                                    print("เพิ่มกลุ่ม");
                                  },
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

  //? Variable 🎒
  ////Colors
  List cardColor = [
    Color.fromRGBO(60, 73, 92, 1).withOpacity(1), //Background Black
    Color.fromRGBO(0, 147, 233, 1).withOpacity(1), // Background Blue
    Color.fromRGBO(116, 138, 157, 1).withOpacity(1), // Background Gray
  ];

  //TextStyle 👺👺
  TextStyle _subjectName = GoogleFonts.kanit(
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    textStyle: TextStyle(
      color: Colors.white,
    ),
  );
  TextStyle _subjectDetail = GoogleFonts.kanit(
    fontSize: 14.0,
    // fontWeight: FontWeight.bold,
    textStyle: TextStyle(
      color: Colors.white,
    ),
  );

  //? Build List Subjects...
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                    int bgColor = index % 3;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Card(
                        color: cardColor[bgColor],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          height: 160,
                          child: Stack(
                            children: <Widget>[
                              //?Name Subject
                              Positioned(
                                top: 20.0,
                                left: 16.0,
                                height: height / 15,
                                width: width / 1.5,
                                child: Text(
                                  "วิชา กฎหมาย ม.44",
                                  style: _subjectName,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),

                              Positioned(
                                top: 46,
                                left: 16.0,
                                height: height / 15,
                                width: width,
                                child: Row(
                                  children: <Widget>[
                                    //?Subject Code
                                    Text(
                                      "รหัสวิชา: 10101800",
                                      style: _subjectDetail,
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),

                                    //?Subject Group
                                    Text(
                                      "Sec: 100",
                                      style: _subjectDetail,
                                    ),
                                  ],
                                ),
                              ),

                              Positioned(
                                top: 65,
                                left: 16.0,
                                height: height / 15,
                                width: width,
                                child: Row(
                                  children: <Widget>[
                                    //?Subject Time
                                    Text(
                                      "เวลา: 09.00 - 12.00",
                                      style: _subjectDetail,
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),

                                    //?Subject Date
                                    Text(
                                      "วันจันทร์",
                                      style: _subjectDetail,
                                    ),
                                  ],
                                ),
                              ),

                              Positioned(
                                top: 95,
                                left: 16.0,
                                height: height / 15,
                                width: width,
                                child: Text(
                                  "ดร.ประหยัด จันทร์โอชา",
                                  style: _subjectDetail,
                                ),
                              ),
                            ],
                          ),
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
