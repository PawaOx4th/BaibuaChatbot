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
      appBar: AppBar(
        title: Text(
          "Application Setting",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,

          ),
        ),
        actions: <Widget>[
          Hero(
            tag: "setting",
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                CoverImage(),
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
                          StudentId(),
                          Faculty(),
                          Branch(),
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

// *********************** Cover Image ****************************************//
class CoverImage extends StatelessWidget {
  String imgUrl =
      'https://images.unsplash.com/photo-1568274602483-355d7fbba69c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1055&q=80';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 5,
//              color: Colors.orange,
      child: Image.network(
        imgUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
//*****************************************************************************//

//****************************** Student ID ***********************************//
class StudentId extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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

            ),
          )
        ],
      ),
    );
  }
}
//*****************************************************************************//

// **************************** Faculty ***************************************//
class Faculty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            ),
          )
        ],
      ),
    );
  }
}
//*****************************************************************************//

//******************************** Branch *************************************//
class Branch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            ),
          )
        ],
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
      top: sheettop,
//      top: 300,
      left: 0,
//      child: MenuContainer(),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isExpanded ? sheettop = 400 : sheettop = minSheettop;
            isExpanded = !isExpanded;
          });
        },
        child: MenuContainer(),
      ),
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
          colors: [Colors.lightBlue[100], Colors.blueAccent],
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
                      AlertButton(),
                      UserDatail(),
                      TimeTable(),
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
                      AddWork(),
                      About(),
                      LogOut(),
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

class AlertButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: 90,
      height: 90,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
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
          Text(
            "การแจ้งเตือน",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class UserDatail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: 90,
      height: 90,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.folder_shared,
                size: 35,
                color: Colors.blue,
              ),
              onPressed: () => print("Click UserData")),
          Text(
            "ข้อมูลส่วนตัว",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class TimeTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: 90,
      height: 90,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.event_note,
              size: 35,
              color: Colors.blue,
            ),
            onPressed: () => print("Click TimeTable"),
          ),
          Text(
            "ตารางเรียน",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class AddWork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: 90,
      height: 90,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.control_point,
                size: 35,
                color: Colors.blue,
              ),
              onPressed: () => print("Click Add Work")),
          Text(
            "เพิ่มงาน",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: 90,
      height: 90,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.developer_mode,
                size: 35,
                color: Colors.blue,
              ),
              onPressed: () => print("Click About")),
          Text(
            "เกี่ยวกับ",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class LogOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: 90,
      height: 90,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.vpn_key,
              size: 35,
              color: Colors.blue,
            ),
            onPressed: () => print("Click Log out"),
          ),
          Text(
            "ออกจากระบบ",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
