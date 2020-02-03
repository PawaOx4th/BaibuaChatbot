import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddGroup extends StatefulWidget {
  @override
  _AddGroupState createState() => _AddGroupState();
}

class _AddGroupState extends State<AddGroup> {
  //************************************************ Global Variable 👑 *******************************************//
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

//**********************************************************************************************/ /

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: customsAppBar(),
      body: SubjectDetail(),
    ));
  }

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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //Working
                      // Padding(
                      //   padding: EdgeInsets.only(left: 25.0),
                      //   child: Stack(
                      //     children: <Widget>[
                      //       IconButton(
                      //         icon: Icon(
                      //           Icons.book,
                      //           color: Color.fromRGBO(166, 188, 208, 1),
                      //           size: 28,
                      //         ),
                      //         onPressed: () {},
                      //       ),
                      //       isWork ? working() : Container(),
                      //     ],
                      //   ),
                      // ),

                      //Name App BAr
                      titleAppbar(),

                      //Notification
                      // Container(
                      //   child: Wrap(
                      //     children: <Widget>[
                      //       Stack(
                      //         children: <Widget>[
                      //           IconButton(
                      //             tooltip: "",
                      //             icon: Icon(
                      //               Icons.notification_important,
                      //               color: Color.fromRGBO(166, 188, 208, 1),
                      //               size: 28,
                      //             ),
                      //             onPressed: () {},
                      //           ),
                      //           isWorkDeadline ? workDeadline() : Container(),
                      //         ],
                      //       ),
                      //       Stack(
                      //         children: <Widget>[
                      //           IconButton(
                      //             tooltip: "เพิ่มกลุ่ม",
                      //             icon: Icon(
                      //               Icons.queue,
                      //               color: Color.fromRGBO(166, 188, 208, 1),
                      //               size: 28,
                      //             ),
                      //             onPressed: () {},
                      //           ),
                      //         ],
                      //       ),
                      //     ],
                      //   ),
                      // ),
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
          "เพิ่มกลุ่ม",
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

class SubjectDetail extends StatefulWidget {
  const SubjectDetail({
    Key key,
  }) : super(key: key);

  @override
  _SubjectDetailState createState() => _SubjectDetailState();
}

class _SubjectDetailState extends State<SubjectDetail> {
  TextEditingController subJectName,
      subJectId,
      subJectSec,
      subjectTime,
      subJectDate,
      subJectTeacher;

  //! ***** TesxtStyle Section***** //
  //TextStyle
  TextStyle hitsTitle = GoogleFonts.kanit(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    textStyle: TextStyle(
      color: Colors.grey[300],
    ),
  );

  TextStyle textDetail = GoogleFonts.kanit(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    textStyle: TextStyle(
      color: Color.fromRGBO(0, 147, 233, 1),
    ),
  );
  //! ***************************** //

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // top: false,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                nameSubject(),
                SizedBox(
                  height: 16.0,
                ),
                idSubject(),
                SizedBox(
                  height: 16.0,
                ),
                secSubject(),
                SizedBox(
                  height: 16.0,
                ),
                timeSubject(),
                SizedBox(
                  height: 16.0,
                ),
                dateSubject(),
                SizedBox(
                  height: 16.0,
                ),
                teacherSubject()
              ],
            ),
          ),
        ),
      ),
    );
  }

  //~~~~~~~~~~~~~~~~~ Widget Section ~~~~~~~~~~~~~~~~~~~~~~//
  Widget nameSubject() => Container(
        // color: Colors.grey[300],
        padding: EdgeInsets.all(14.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
        ),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "ชื่อวิชา",
            hintStyle: hitsTitle,
            border: InputBorder.none,
          ),
          style: textDetail,
          controller: subJectName, //** => Name Subject controller */
        ),
      );

  Widget idSubject() => Container(
        padding: EdgeInsets.all(14.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
        ),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "รหัสวิชา",
            hintStyle: hitsTitle,
            border: InputBorder.none,
          ),
          style: textDetail,
          controller: subJectId, //** => ID Subject controller */
        ),
      );

  Widget secSubject() => Container(
        padding: EdgeInsets.all(14.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
        ),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "กลุ่มเรียน",
            hintStyle: hitsTitle,
            border: InputBorder.none,
          ),
          style: textDetail,
          controller: subJectSec, //** => ID Subject controller */
        ),
      );

  Widget timeSubject() => Container(
        padding: EdgeInsets.all(14.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
        ),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "เวลาเรียน",
            hintStyle: hitsTitle,
            border: InputBorder.none,
          ),
          style: textDetail,
          controller: subjectTime, //** => ID Subject controller */
        ),
      );

  Widget dateSubject() => Container(
        padding: EdgeInsets.all(14.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
        ),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "วันเรียน",
            hintStyle: hitsTitle,
            border: InputBorder.none,
          ),
          style: textDetail,
          controller: subJectDate, //** => ID Subject controller */
        ),
      );

  Widget teacherSubject() => Container(
        padding: EdgeInsets.all(14.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
        ),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "ชื่ออาจารย์ผู้สอน",
            hintStyle: hitsTitle,
            border: InputBorder.none,
          ),
          style: textDetail,
          controller: subJectTeacher, //** => ID Subject controller */
        ),
      );
}
