import 'package:baibuaapp/models/settingmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting_Page extends StatefulWidget {
  @override
  _Setting_PageState createState() => _Setting_PageState();
}

class _Setting_PageState extends State<Setting_Page> {
  Settingmodel setting = Settingmodel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LayoutStart(),
    );
  }
}

// **************************** Layout Start Section  ************************//
class LayoutStart extends StatefulWidget {
  @override
  _LayoutStartState createState() => _LayoutStartState();
}

class _LayoutStartState extends State<LayoutStart> {
  String imgUrl =
      'https://images.unsplash.com/photo-1568274602483-355d7fbba69c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1055&q=80';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 5,
//              color: Colors.orange,
                  child: Image.network(
                    imgUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white70,
                  child: Container(
                    color: Colors.white70,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height / 15,
                            color: Colors.transparent,
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "115910400XXX-2",
                                  style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                    fontFamily: 'FC Lamoon',
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            height: MediaQuery.of(context).size.height / 28,
//                            color: Colors.green,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "xxxxxxx xxxx",
                                  style: TextStyle(
                                    fontSize: 30,
//                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                    fontFamily: 'FC Lamoon',
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            height: MediaQuery.of(context).size.height / 50,
//                            color: Colors.green,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "คณะวิศวกรรมศาสตร์",
                                  style: TextStyle(
                                    fontSize: 20,
//                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                    fontFamily: 'FC Lamoon',
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            height: MediaQuery.of(context).size.height / 28,
//                            color: Colors.green,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "ภาควิชาวิศวกรรมคอมพิวเตอร์",
                                  style: TextStyle(
                                    fontSize: 20,
//                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                    fontFamily: 'FC Lamoon',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            MenuTab(),
          ],
        ),
      ),
    );
  }
}

//*****************************************************************************//

// *************************** Menu Tab Section *******************************//
class MenuTab extends StatefulWidget {
  @override
  _MenuTabState createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> {
  bool isExpanded = false;
  double sheettop = 400;
  double minSheettop = 30;

  @override
  Widget build(BuildContext context) {
    return Positioned(
//      top: sheettop,
      top: 300,
      left: 0,
      child: MenuContainer(),
//      child: GestureDetector(
//        onTap: () {
//          setState(() {
//            isExpanded ? sheettop = 400 : sheettop = minSheettop;
//            isExpanded = !isExpanded;
//          });
//        },
//        child: MenuContainer(),
//      ),
    );
  }
}
// ****************************************************************************//

//  ********************** Menu Container *************************************//
class MenuContainer extends StatefulWidget {
  @override
  _MenuContainerState createState() => _MenuContainerState();
}

class _MenuContainerState extends State<MenuContainer> {
  Settingmodel settingmodel = Settingmodel();

  @override
  Widget build(BuildContext context) {
    double sheetitemHeight = 90;

    return Container(
      padding: EdgeInsets.only(top: 20),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
//        color: Colors.blue,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.lightBlue[100],Colors.blueAccent],
        ),
      ),
      child: Column(
        children: <Widget>[
//          drawHandle(),
          Expanded(
            flex: 1,
            child: ListView(
              children: <Widget>[
                offerDetails(sheetitemHeight),
              ],
            ),
          ),
        ],
      ),
    );
  }

  drawHandle() {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      height: 5,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
    );
  }

  offerDetails(double sheetItemHeight) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 35),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Option Setting",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'FC Lamoon',
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 15, left: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 15),
                height: sheetItemHeight,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        width: sheetItemHeight,
                        height: sheetItemHeight,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.add_alert,
                                size: 35,
                                color: Colors.blue,
                              ),
                              onPressed: () {
                                print("Click Alert");
                              },
                            ),
//                            Icon(
//                              Icons.add_alert,
//                              size: 40,
//                              color: Colors.blue,
//
//                            ),
                            Text(
                              settingmodel.alert,
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                fontFamily: 'FC Lamoon',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        width: sheetItemHeight,
                        height: sheetItemHeight,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.folder_shared,
                              size: 40,
                              color: Colors.blue,
                            ),
                            Text(
                              settingmodel.dataUser,
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                fontFamily: 'FC Lamoon',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        width: sheetItemHeight,
                        height: sheetItemHeight,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.event_note,
                              size: 40,
                              color: Colors.blue,
                            ),
                            Text(
                              settingmodel.timeTable,
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                fontFamily: 'FC Lamoon',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                height: sheetItemHeight,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        width: sheetItemHeight,
                        height: sheetItemHeight,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.control_point,
                              size: 40,
                              color: Colors.blue,
                            ),
                            Text(
                              settingmodel.addWork,
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                fontFamily: 'FC Lamoon',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        width: sheetItemHeight,
                        height: sheetItemHeight,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.developer_mode,
                              size: 40,
                              color: Colors.blue,
                            ),
                            Text(
                              settingmodel.about,
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                fontFamily: 'FC Lamoon',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        width: sheetItemHeight,
                        height: sheetItemHeight,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.vpn_key,
                              size: 40,
                              color: Colors.blue,
                            ),
                            Text(
                              settingmodel.logOut,
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                fontFamily: 'FC Lamoon',
                              ),
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
        ),
      ],
    );
  }
}
// ***************************************************************************//
