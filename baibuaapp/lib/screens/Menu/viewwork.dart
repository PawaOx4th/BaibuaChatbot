import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle Header = TextStyle(
    fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent);

TextStyle subHeader = TextStyle(
    fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blueAccent);

TextStyle datePicker = TextStyle(
    fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey[400]);

TextStyle dateReturn =
    TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red);

TextStyle daTailStyle =
    TextStyle(fontSize: 14, fontWeight: FontWeight.w200, color: Colors.grey);

//********************** Global Variable  On Page ***********************************//
String _subjectSelect;
//****************************************************************************//

class ViewWork extends StatefulWidget {
  @override
  _ViewWorkState createState() => _ViewWorkState();
}

class _ViewWorkState extends State<ViewWork> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          color: Colors.blue[50],
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                // Section Select Subject
                child: Container(
//                color: Colors.pinkAccent,
                  child: SelectSubject(),
                ),
              ),
              Expanded(
                  flex: 4,
                  // Section Card View Work
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Container(
                        child: CardWork(),
//                      color: Colors.amber,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
//    return Container(
//      color: Colors.amber,
//    );
  }
}

//****************************** SelectSubject *******************************//
class SelectSubject extends StatefulWidget {
  @override
  _SelectSubjectState createState() => _SelectSubjectState();
}

class _SelectSubjectState extends State<SelectSubject> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  "ดูงานในรายวิชา",
                  style: Header,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
//            crossAxisAlignment: CrossAxisAlignment.,
            children: <Widget>[
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
//                color: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blue, width: 2),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: dropdownSelectSubject(context),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // *************************** DropdowSelect Subject  *************************//
  String dropdownValue = '';
  String _currentItemSelected = 'คอมพิวเตอร์โปรแกรมมิ่ง';

  // Set Item in DropDown Menu
  var _dropdownmenu = [
    'คอมพิวเตอร์โปรแกรมมิ่ง',
    'กลศาสตร์',
    'ฟิสิกส์',
    'ไมโครคอนโทรเลอร์และการเชื่อมต่อประสาน1111111111111111111111111111111111111111111111111111111111111111111',
  ];

  Widget dropdownSelectSubject(BuildContext context) {
    return DropdownButton(
      underline: Container(
        color: Colors.transparent,
      ),
      elevation: 10,
      isExpanded: true,
      items: _dropdownmenu.map((String dropDownStringItem) {
        return DropdownMenuItem(
          value: dropDownStringItem,
          child: Text(
            dropDownStringItem,
            overflow: TextOverflow.ellipsis,
            style: subHeader,
            softWrap: true,
          ),
        );
      }).toList(),
      onChanged: (String newValueSelect) {
        // Your Code to execute, when a menu item is selected from drop down
        setState(() {
          this._currentItemSelected = newValueSelect;

          //*********** Set Subject select ***********
          _subjectSelect = newValueSelect;
          print(_subjectSelect);
          //******************************************
        });
      },
      value: _currentItemSelected,
    );
  }
}
//****************************************************************************//

//****************************** Card Show Work *******************************//

class CardWork extends StatefulWidget {
  @override
  _CardWorkState createState() => _CardWorkState();
}

class _CardWorkState extends State<CardWork> {
  //****************************************************************//
  List<FakeData> fakeDatas = [
    FakeData(
      nameSubject: 'กลศาสตร์',
      detail:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      dateReturn: "31-12-2562",
      datePicker: "19-12-2562",
    ),
    FakeData(
      nameSubject: 'กลศาสตร์',
      detail:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      dateReturn: "32-12-2562",
      datePicker: "20-12-2562",
    ),
    FakeData(
      nameSubject: 'กลศาสตร์',
      detail:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      dateReturn: "33-12-2562",
      datePicker: "21-12-2562",
    ),
    FakeData(
      nameSubject: 'กลศาสตร์',
      detail:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      dateReturn: "33-12-2562",
      datePicker: "21-12-2562",
    ),
    FakeData(
      nameSubject: 'กลศาสตร์',
      detail:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      dateReturn: "33-12-2562",
      datePicker: "21-12-2562",
    ),
    FakeData(
      nameSubject: 'กลศาสตร์',
      detail:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      dateReturn: "33-12-2562",
      datePicker: "21-12-2562",
    ),
  ];

  //****************************************************************//

  //************************** Card Widget ************************//

  Widget cardView(fakeData) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(100),
        ),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        height: MediaQuery.of(context).size.height / 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  fakeData.datePicker,
                  style: datePicker,
                ),
                Text(
                  fakeData.dateReturn,
                  style: dateReturn,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                   decoration: BoxDecoration(
//                     color: Colors.lightBlue[50]
                   ),
                    width: 250,
                    height: MediaQuery.of(context).size.height / 6,
                    alignment: Alignment.center,
                    child: Text(
                      fakeData.detail,
                      textAlign: TextAlign.start,
                      style: daTailStyle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //***************************************************************//

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Column(
              children:
                  fakeDatas.map((fakeData) => cardView(fakeData)).toList()),
        ],
      ),
    );
  }
}

//****************************************************************************//

class FakeData {
  String nameSubject;
  String detail;
  String datePicker;
  String id;
  String dateReturn;

  FakeData(
      {this.nameSubject,
      this.detail,
      this.datePicker,
      this.dateReturn,
      this.id});
}
