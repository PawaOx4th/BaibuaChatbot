import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

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

  String _myActivity;
  String dropdownValue = 'จันทร์';

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
                teacherSubject(),
                SizedBox(
                  height: 16.0,
                ),
                // dropDownDate()
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
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(14.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "วันเรียน",
              style: hitsTitle,
            ),
            DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: textDetail,
              underline: Container(
                height: 2,
                color: Colors.blue,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                  print(dropdownValue);
                });
              },
              items: <String>[
                'อาทิตย์',
                'จันทร์',
                'อังคาร',
                'พุธ',
                'พฤหัสบดี',
                "ศุกร์",
                "เสาร์",
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      );

  Widget dropDownDate() => Container(
        padding: EdgeInsets.all(16),
        child: DropDownFormField(
          titleText: 'My workout',
          hintText: 'Please choose one',
          value: _myActivity,
          onSaved: (value) {
            setState(() {
              _myActivity = value;
            });
          },
          onChanged: (value) {
            setState(() {
              _myActivity = value;
            });
          },
          dataSource: [
            {
              "display": "Running",
              "value": "Running",
            },
            {
              "display": "Climbing",
              "value": "Climbing",
            },
            {
              "display": "Walking",
              "value": "Walking",
            },
            {
              "display": "Swimming",
              "value": "Swimming",
            },
            {
              "display": "Soccer Practice",
              "value": "Soccer Practice",
            },
            {
              "display": "Baseball Practice",
              "value": "Baseball Practice",
            },
            {
              "display": "Football Practice",
              "value": "Football Practice",
            },
          ],
          textField: 'display',
          valueField: 'value',
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
