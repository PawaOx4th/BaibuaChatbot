import 'package:baibuaapp/Screens/Authenticate/login.dart';
import 'package:baibuaapp/Widgets/customAppBar.dart';
import 'package:baibuaapp/models/statWorkCount.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:custom_switch/custom_switch.dart';

import 'package:baibuaapp/Screens/Authenticate/autu.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  //Variable
  final bool isWork = true;
  final bool isWorkDeadline = false;
  bool status = true;
  String iD = '';

  String _countWorking = "2";
  String _countWorkDeadline = "20";

  //TextStyle
  TextStyle _googleFontRoboto = GoogleFonts.roboto(
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    textStyle: TextStyle(color: Color.fromRGBO(0, 147, 233, 1)),
  );

  TextStyle _googleFontKanit = GoogleFonts.kanit(
    fontSize: 22.0,
    fontWeight: FontWeight.w500,
    textStyle: TextStyle(color: Color.fromRGBO(0, 147, 233, 1)),
  );

  TextStyle _detailFontKanit = GoogleFonts.kanit(
    fontSize: 16.0,
    textStyle: TextStyle(color: Color.fromRGBO(81, 92, 111, 1)),
  );

  TextStyle _detailFontKanitWhite = GoogleFonts.kanit(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    textStyle: TextStyle(color: Colors.white),
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

  final AuthService _authService = AuthService();

  Future<void> findDisplay() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    String userId = firebaseUser.displayName;
    setState(() {
      iD = userId;
    });
    print("Displayname In Main Menu Page => " + userId);
  }

  @override
  void initState() {
    super.initState();
    findDisplay();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ChangeNotifierProvider(
      create: (_) => WorkCount(),
      child: Scaffold(
        backgroundColor: bgMenuColor,
        appBar: appBarCustom(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: <Widget>[
              // alertCheck(),
              SizedBox(height: 8),
              useApp(),
              SizedBox(height: 8),
              feedBack(),
              SizedBox(height: 8),
              aboutApp(),
              SizedBox(height: 32),
              logOutButton(),
            ],
          ),
        ),
      ),
    ));
  }

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Widget Section !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  Widget appBarCustom() {
    return PreferredSize(
      preferredSize: Size.fromHeight(59),
      child: Column(
        children: <Widget>[
          CustomAppBarr('ตั้งค่า'),
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
          "ตั้งค่า",
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

// Widget list Menu => Alert Check
  Widget alertCheck() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.notification_important,
                  color: Colors.blueAccent,
                  size: 32,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  "การแจ้งเตือน",
                  style: _detailFontKanit,
                )
              ],
            ),
          ),

          // Switch
          Container(
            height: 25,
            child: CustomSwitch(
              activeColor: Colors.blueAccent,
              value: status,
              onChanged: (value) {
                print("VALUE : $value");
                setState(() {
                  status = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget list Menu => User App
  Widget useApp() {
    return InkWell(
      onTap: () {
        print("๊การใช้งานแอป");
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.import_contacts,
                    color: Colors.blueAccent,
                    size: 32,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "การใช้งาน App",
                    style: _detailFontKanit,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget list Menu => About App
  Widget aboutApp() {
    return InkWell(
      onTap: () {
        print("Feed Back");
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.developer_mode,
                    color: Colors.blueAccent,
                    size: 32,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "About App",
                    style: _detailFontKanit,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget list Menu => Feed Back`
  Widget feedBack() {
    return InkWell(
      onTap: () {
        print("Feed Back");
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.contact_mail,
                    color: Colors.blueAccent,
                    size: 32,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Feedback",
                    style: _detailFontKanit,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget list Menu => Feed Back
  Widget logOutButton() {
    return InkWell(
      onTap: () async {
        await _authService.signOut();
        print(_authService.toString());
//       Navigator.pushNamed(context, '/Login-page');
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext) => LoginScreen());
        Navigator.of(context).pushAndRemoveUntil(
            materialPageRoute, (Route<dynamic> route) => false);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.redAccent[400]),
        child: Text(
          "ออกจากระบบ",
          style: _detailFontKanitWhite,
        ),
      ),
    );
  }

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

}
