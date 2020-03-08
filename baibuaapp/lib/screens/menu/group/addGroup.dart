import 'dart:io';

import 'package:baibuaapp/REST%20API/fetchGroup.dart';

import 'package:baibuaapp/models/group.dart';
import 'package:baibuaapp/models/studentGroup.dart';
import 'package:http/http.dart' as Http;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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

  TextStyle _countwork =
      TextStyle(color: Colors.white70, fontWeight: FontWeight.bold);
//**********************************************************************************************/ /

  Future<void> findDisplay() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    String userId = firebaseUser.displayName;
    setState(() {
      iD = userId;
    });
  }

  @override
  void initState() {
    super.initState();
    findDisplay();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: customsAppBar(),
        body: ShowGroup(
          userId: iD,
        ),
      ),
    );
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
                      //Name App BAr
                      titleAppbar(),
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

class ShowGroup extends StatefulWidget {
  //
  ShowGroup({Key key, this.userId}) : super(key: key);
  //
  String userId = "";

  @override
  _ShowGroupState createState() => _ShowGroupState();
}

class _ShowGroupState extends State<ShowGroup> {
  //   //! ******************* TesxtStyle Section *************************** //
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

  TextStyle subjectName = GoogleFonts.kanit(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    textStyle: TextStyle(
      color: Colors.white,
    ),
  );
  TextStyle subjectDetail = GoogleFonts.kanit(
    fontSize: 16.0,
    // fontWeight: FontWeight.bold,
    textStyle: TextStyle(
      color: Colors.white,
    ),
  );
  TextStyle subjectDetailGroup = GoogleFonts.kanit(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    textStyle: TextStyle(
      color: Colors.white,
    ),
  );
  //   //! *******************************************************************//

  //  //! ********************* Colors ************************************** //
  List cardColor = [
    Color.fromRGBO(60, 73, 92, 1), //Background Black
    Color.fromRGBO(0, 147, 233, 1), // Background Blue
    Color.fromRGBO(116, 138, 157, 1) // Background Gray
  ];
  // //! *********************************************************************//

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return FutureBuilder<List<Group>>(
      future: GetGroup.getGroup(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<Group> groupData = snapshot.data;
          return ListView.builder(
            itemCount: groupData.length,
            itemBuilder: (BuildContext context, index) {
              int bgColor = index % 3;

              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
                child: Card(
                  color: cardColor[bgColor],
                  child: Container(
                    height: height * 0.15,
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          // color: Colors.white70,
                          width: width * 0.6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "รหัสวิชา : " + groupData[index].sec.subject,
                                style: subjectName,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                groupData[index].sec.studyTime[0] +
                                    "  " +
                                    groupData[index].sec.studyTime[1] +
                                    "-" +
                                    groupData[index].sec.studyTime[2],
                                style: subjectDetail,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.folderAccount,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "กลุ่ม : ${groupData[index].sec.sec} ",
                                    style: subjectDetailGroup,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            MdiIcons.tagPlus,
                            // folder-account
                            size: 50,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            print("ADD GROUP $index");
                            addStudentToGroup(
                                groupId: groupData[index].id,
                                id: widget.userId,
                                context: context);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  addStudentToGroup({String groupId, String id, BuildContext context}) async {
    ////////////////////////////////////////////////////////////////////////////
    var studentTogroup = StudentGroup();
    studentTogroup.id = groupId;
    studentTogroup.student = id;
    var studentTogroupJson = studentGroupToJson(studentTogroup);
    print(studentTogroupJson);
    ////////////////////////////////////////////////////////////////////////////
    String url =
        "https://us-central1-newagent-47c20.cloudfunctions.net/api/group/student";
    var addApi = await Http.post(
      url,
      body: studentTogroupJson,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );
    ////////////////////////////////////////////////////////////////////////////
    if (addApi.statusCode == 201) {
      print(" Student in Group Success");
      print("${addApi.body}");
      _showDialogComplete(context);
    } else {
      print("ERROR");
      print("${addApi.body}");
      _showDialogError(context);
    }
    ////////////////////////////////////////////////////////////////////////////
  }

  void _showDialogComplete(BuildContext context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "สำเร็จ",
      desc: "เพิ่มเข้ากลุ่มสำเร็จ",
      buttons: [
        DialogButton(
          color: Colors.green,
          child: Text(
            "ปิด",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

  void _showDialogError(BuildContext context) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "เกิดข้อผิดพลาด",
      desc: "ไม่สามารถเข้ากลุ่มได้",
      buttons: [
        DialogButton(
          color: Colors.redAccent,
          child: Text(
            "ปิด",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }
}
