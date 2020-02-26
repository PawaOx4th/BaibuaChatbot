import 'package:baibuaapp/REST%20API/fetchWork.dart';

import 'package:baibuaapp/Screens/menu/work/workDetail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:baibuaapp/models/workInGroup.dart';

class Work extends StatefulWidget {
  Work({Key key, this.groupId, this.nameSubject, this.lavelUser})
      : super(key: key);

  @override
  _WorkState createState() => _WorkState();

  final String groupId;
  final String nameSubject;
  final int lavelUser;
}

class _WorkState extends State<Work> {
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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customsAppBar(context),
        body: WorkGroup(
          subjectid: widget.groupId,
        ),
        floatingActionButton: (widget.lavelUser == 1) ? addWork() : null,
      ),
    );
  }

  //~ Widget
  Widget customsAppBar(context) {
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
                        padding: EdgeInsets.only(left: 20.0),
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
                      titleAppbar(context),

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
  Widget titleAppbar(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 2,
          child: Text(
            widget.nameSubject,
            style: _googleFontKaniTitle,
            // softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
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

  Widget addWork() {
    return FloatingActionButton(
      child: Icon(Icons.note_add),
      onPressed: () {
        // print("รหัสกลุ่ม ${widget.groupId}");

        Navigator.of(context).pushNamed("/addwork", arguments: widget.groupId);
      },
    );
  }
}

class WorkGroup extends StatefulWidget {
  WorkGroup({Key key, this.subjectid}) : super(key: key);

  final subjectid;

  @override
  _WorkGroupState createState() => _WorkGroupState();
}

class _WorkGroupState extends State<WorkGroup> {
  ////Colors
  List cardColor = [
    Color.fromRGBO(60, 73, 92, 1).withOpacity(1), //Background Black
    Color.fromRGBO(0, 147, 233, 1).withOpacity(1), // Background Blue
    Color.fromRGBO(116, 138, 157, 1).withOpacity(1), // Background Gray
  ];

  //TextStyle 👺👺
  TextStyle _workName = GoogleFonts.kanit(
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    textStyle: TextStyle(
      color: Colors.white,
    ),
  );
  TextStyle _workDetail = GoogleFonts.kanit(
    fontSize: 14.0,
    // fontWeight: FontWeight.bold,
    textStyle: TextStyle(
      color: Colors.white,
    ),
  );

  buildGotoworkDetail({String workID}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkDetail(
          workId: workID,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //? ----------------------------------------------- //
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    //? ----------------------------------------------- //

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: height,
              child: FutureBuilder(
                future: FetchWork.fecthwork(subjectId: widget.subjectid),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<WorkInGroup> workmodel = snapshot.data;

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: workmodel.length,
                      itemBuilder: (context, index) {
                        int bgColor = index % 3;
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.2),
                          child: InkWell(
                            child: Card(
                              color: cardColor[bgColor],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Container(
                                height: 130,
                                padding: EdgeInsets.only(left: 26.0, top: 16.0),
                                child: Stack(
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          workmodel[index].topic,
                                          style: _workName,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          "สั่งเมื่อ : ${workmodel[index].createDate[0]} ${workmodel[index].createDate[1]} ${workmodel[index].createDate[2]}",
                                          style: _workDetail,
                                        ),
                                        Text(
                                          "กำหนดส่ง : ${workmodel[index].sendDate[0]} ${workmodel[index].sendDate[1]} ${workmodel[index].sendDate[2]}",
                                          style: _workDetail,
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      bottom: 20,
                                      right: 16.0,
                                      child: Icon(
                                        Icons.account_circle,
                                        size: 55,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              buildGotoworkDetail(workID: workmodel[index].id);
                            },
                          ),
                        );
                      },
                    );
                  } else {
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
