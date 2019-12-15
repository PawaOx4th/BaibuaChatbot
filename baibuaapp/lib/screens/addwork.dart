import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

TextStyle Header = TextStyle(
    fontSize: 26,
    fontFamily: 'FC Lamoon',
    fontWeight: FontWeight.bold,
    color: Colors.blueAccent);

class AddworkPage extends StatefulWidget {
  @override
  _AddworkPageState createState() => _AddworkPageState();
}

// ***************************** Main Layout *********************************//
class _AddworkPageState extends State<AddworkPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: SelectSubject(),
//                  Container(
//                    color: Colors.lightGreenAccent,
//                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    color: Colors.greenAccent,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    color: Colors.cyan,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
// ***************************************************************************//

// **************************** Select Subject Section one *******************//
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
                  "เพิ่มงานในรายวิชาที่เลือก",
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

  String dropdownValue = '';
  String _currentItemSelected = 'คอมพิวเตอร์โปรแกรมมิ่ง';

  // Set Item in DropDown Menu
  var _dropdownmenu = [
    'คอมพิวเตอร์โปรแกรมมิ่ง',
    'กลศาสตร์',
    'ฟิสิกส์',
    'ไมโครคอนโทรเลอร์และการเชื่อมต่อประสาน',
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
            style: TextStyle(color: Colors.blue),
          ),
        );
      }).toList(),
      onChanged: (String newValueSelect) {
        // Your Code to execute, when a menu item is selected from drop down
        setState(() {
          this._currentItemSelected = newValueSelect;
          print(_currentItemSelected);
        });
      },
      value: _currentItemSelected,
    );
  }
}
// ***************************************************************************//

// *************************** DropdowSelect Subject  *************************//

// ***************************************************************************//
