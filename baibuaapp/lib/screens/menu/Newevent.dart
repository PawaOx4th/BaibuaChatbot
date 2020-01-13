import 'dart:convert';

import 'package:baibuaapp/REST%20API/Newservice.dart';
import 'package:baibuaapp/models/Newmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as Http;

class NewEvent extends StatefulWidget {
  @override
  _NewEventState createState() => _NewEventState();
}

class _NewEventState extends State<NewEvent>
    with SingleTickerProviderStateMixin {
  //Variable
  final bool isWork = true;
  final bool isWorkDeadline = false;
  String iD = '';
  String _countWorking = "2";
  String _countWorkDeadline = "20";
  List newsData;

  //TextStyle
  TextStyle _googleFontRoboto = GoogleFonts.roboto(
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    textStyle: TextStyle(color: Color.fromRGBO(0, 147, 233, 1)),
  );

  TextStyle _googleFontKanit = GoogleFonts.kanit(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    textStyle: TextStyle(color: Colors.white),
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

//  Color cardBackgroudBack = Color.fromRGBO(60, 73, 92, 1);
//  Color cardBackgroudBlue = Color.fromRGBO(0, 147, 233, 1);
//  Color cardBackgroudGray = Color.fromRGBO(116, 138, 157, 1);

  List cardColor = [
    Color.fromRGBO(60, 73, 92, 1),
    Color.fromRGBO(0, 147, 233, 1),
    Color.fromRGBO(116, 138, 157, 1),
  ];

  NewsService newsService = NewsService();

//  Method
  Future<String> getNews() async {
    String _urlNews =
        "https://us-central1-newagent-47c20.cloudfunctions.net/api/news";
    var response = await Http.get(_urlNews);
    setState(() {
      newsData = jsonDecode(response.body);
    });

    return "Success ";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                              onPressed: () {
                                print(height.toString());
                              },
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
        body: SingleChildScrollView(
//          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    height: MediaQuery.of(context).size.height * 0.83,
                    child: ListView.builder(
                      itemCount: newsData == null ? 0 : newsData.length,
                      itemBuilder: (context, index) {
                        // Set Card Color
                        int countColor = index % 3;

                        //Show News  =>  newsData[index]['Topic'],
                        return Container(
                          height: height * 0.28,
                          child: InkWell(
                            onTap: () => print(index + 1),
                            child: Card(
                              color: cardColor[countColor],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              elevation: 1,
                              child: Container(
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      top: 50,
                                      left: 0,
                                      child: Container(
                                        width: 300,
                                        height: 100,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text( newsData[index]['Topic'],style: _googleFontKanit,overflow: ,),
                                          ],
                                        )
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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
