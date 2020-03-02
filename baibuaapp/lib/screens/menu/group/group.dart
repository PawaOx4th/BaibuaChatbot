import 'dart:convert';

import 'package:baibuaapp/Widgets/customAppBar.dart';
import 'package:baibuaapp/models/statWorkCount.dart';
import 'package:baibuaapp/models/userdata.dart';
import 'package:http/http.dart' as Http;

import 'package:baibuaapp/REST%20API/getAllSubject.dart';
import 'package:baibuaapp/Screens/menu/work/work.dart';
import 'package:flutter/widgets.dart';
import 'package:baibuaapp/models/groupMpdel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  TextStyle _countwork =
      TextStyle(color: Colors.white70, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (_) => WorkCount(),
        child: Scaffold(
          appBar: customsAppBar(context),
          body: GroupSubject(),
        ),
      ),
    );
  }

  //***********************************************************************//
  //~ Widget
  Widget customsAppBar(context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(58),
      child: Column(
        children: <Widget>[CustomAppBarr("กลุ่ม")],
      ),
    );
  }

  // Widget App Name
  Widget titleAppbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
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

//! ************************************************************************************************ //
//todo Class Group Subject  Return Subjects..
class GroupSubject extends StatefulWidget {
  @override
  _GroupSubjectState createState() => _GroupSubjectState();
}

class _GroupSubjectState extends State<GroupSubject> {
  //? Key
  Key _singleChildScroll, _mainColumn, _cardId;

  //? Variable 🎒
  String iD = '';
  String idGroup = '';
  int userLavel = 0;

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

  Future<void> findDisplay() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    String userId = firebaseUser.displayName;
    setState(() {
      iD = userId;
    });
    findLavel(userID: userId);
  }

  callWork({String groupId, String subJectName}) {
    print('Select Work');
    print("$groupId");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Work(
          groupId: groupId,
          nameSubject: subJectName,
          lavelUser: userLavel,
        ),
      ),
    );
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
    super.initState();
    findDisplay();
  }

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
              child: FutureBuilder<List<GroupModel>>(
                //**  Call Function..
                future: AllSubject.getAllGroup(userId: iD),

                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  //** Check Data not Null..
                  if (snapshot.hasData) {
                    List<GroupModel> groupModel = snapshot.data;

                    //**  Set Build Data Show !!
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      // scrollDirection: Axis.horizontal,
                      itemCount: groupModel.length,
                      itemBuilder: (BuildContext context, index) {
                        int bgColor = index % 3;
                        print(bgColor);
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: InkWell(
                            child: Card(
                              key: _cardId,
                              color: cardColor[bgColor],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),

                              //** InkWell..
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
                                        groupModel[index]
                                            .sec
                                            .subject, //** => Show Name Subject */
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
                                            "Sec: ${groupModel[index].sec.sec}",
                                            style: _subjectDetail,
                                          ),
                                        ],
                                      ),
                                    ),

                                    Positioned(
                                      top: 79,
                                      left: 16.0,
                                      height: height / 15,
                                      width: width,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          //?Subject Time
                                          Text(
                                            "สร้างวันที่ : ${groupModel[index].sec.createDate[0]} ${groupModel[index].sec.createDate[1]} ${groupModel[index].sec.createDate[2]}",
                                            style: _subjectDetail,
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),

                                          //?Subject Date
                                          Text(
                                            "อัปเดตล่าสุด : ${groupModel[index].sec.updateDate[0]} ${groupModel[index].sec.updateDate[1]} ${groupModel[index].sec.updateDate[2]}",
                                            style: _subjectDetail,
                                          ),
                                        ],
                                      ),
                                    ),

                                    Positioned(
                                      top: 120,
                                      left: 16.0,
                                      height: height / 15,
                                      width: width,
                                      child: Text(
                                        "${groupModel[index].teacher1}",
                                        style: _subjectDetail,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onTap: () => {
                              callWork(
                                  groupId: groupModel[index].id,
                                  subJectName: groupModel[index].sec.subject)
                            },
                          ),
                        );
                      },
                    );
                  }

                  //* Data has Null
                  else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// /setState(() {
//                           idGroup = groupModel[index].id;
//                           print("Set State ${idGroup}");
//                         });
