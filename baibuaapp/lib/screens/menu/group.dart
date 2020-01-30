import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Group extends StatefulWidget {
  const Group({Key key}) : super(key: key);

  @override
  _GroupState createState() => _GroupState();
}

class _GroupState extends State<Group> {
  final bool isWork = true;

  final bool isWorkDeadline = true;

  String iD = '';

  String _countWorking = "2";

  String _countWorkDeadline = "20";

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

  List cardColor = [
    Color.fromRGBO(0, 147, 233, 1).withOpacity(0.6), // Background Blue
    Color.fromRGBO(60, 73, 92, 1).withOpacity(0.6), //Background Black
    Color.fromRGBO(116, 138, 157, 1).withOpacity(0.6), // Background Gray
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, height),
        body: SingleChildScrollView(
          child: Container(
            // color: Colors.redAccent,
            // height: height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    height: height * 0.80,
                    // color: Colors.grey,
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        int countColor = index % 3;
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 8.00),
                          height: height * 0.22,
                          child: Card(
                            color: cardColor[countColor],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            elevation: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  //Name Subject
                                  Positioned(
                                    top: 26,
                                    left: 16,
                                    child: Text(
                                      "วิชา" + "กฎหมาย ม.44",
                                    ),
                                  ),
                                  Positioned(
                                    top: 60,
                                    left: 16,
                                    child: Container(
                                      color: Colors.greenAccent,
                                      width: 200,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Text("รหัสวิชา : " + "1010800"),
                                          Text("Sec : " + "1010")
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 90,
                                    left: 16,
                                    child: Container(
                                      color: Colors.greenAccent,
                                      width: 200,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Text("เวลา  " + "9.00 - 11.00 น."),
                                          Text("วันจันทร์")
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 116,
                                    left: 16,
                                    child: Container(
                                      color: Colors.greenAccent,
                                      width: 200,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Text("อ. ประยุทธ หน้าหี"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
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

  //*******************************************************************************************//
  //~ Widget Secction
  Widget appBar(context, height) {
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
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
                      width: 80,
                    ),
                    titleAppbar(),
                    SizedBox(
                      width: 70,
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
                    SizedBox(
                      width: 2.00,
                    ),
                    Stack(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.create_new_folder,
                            color: Color.fromRGBO(166, 188, 208, 1),
                            size: 28,
                          ),
                          onPressed: () {},
                        ),
                        isWork ? working() : Container(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

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

  //*******************************************************************************************//

}
