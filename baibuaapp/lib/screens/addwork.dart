import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:baibuaapp/widgets/datetime_picker_formfield.dart';

// ignore: non_constant_identifier_names
TextStyle Header = TextStyle(
    fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent);

TextStyle subHeader = TextStyle(
    fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blueAccent);

class AddworkPage extends StatefulWidget {
  @override
  _AddworkPageState createState() => _AddworkPageState();
}

// ***************************** Main Layout *********************************//
class _AddworkPageState extends State<AddworkPage> {
  final String imgBg =
      "https://images.unsplash.com/photo-1504941214544-9c1c44559ab4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.white, Colors.blue])
//                image: DecorationImage(
//                  image: NetworkImage(imgBg),
//                  fit: BoxFit.cover,
//                ),
              ),
              child: Column(
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
                    child: DetailOfWork(),
//                  Container(
//                    color: Colors.greenAccent,
//                  ),
                  ),
                  Flexible(
                    flex: 2,
                    child: DateTimeSelect(),
//                    Container(
//                      color: Colors.cyan,
//                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
//                      color: Colors.amber,
                      child: Container(
                        width: 200,
                        height: 60,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.blue),
                          ),
                          color: Colors.blue,
                          child: Text(
                            "ยืนยัน",
                            style: TextStyle(color: Colors.white),
                          ),
                          elevation: 5,
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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

// ************************* Detail Of Work **********************************//
class DetailOfWork extends StatefulWidget {
  @override
  _DetailOfWorkState createState() => _DetailOfWorkState();
}

class _DetailOfWorkState extends State<DetailOfWork> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  "รายละเอียด",
                  style: Header,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
//            color: Colors.blue[50],
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 2,
              ),
              color: Colors.white70,
            ),
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextField(
              style: TextStyle(
                color: Colors.black45,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              maxLines: null,
              keyboardType: TextInputType.multiline,
              maxLength: 180,
            ),
          ),
        )
      ],
    );
  }
}
// ***************************************************************************//

// ************************* DateTime Of Work ********************************//

class DateTimeSelect extends StatefulWidget {
  @override
  _DateTimeSelectState createState() => _DateTimeSelectState();
}

class _DateTimeSelectState extends State<DateTimeSelect> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  "รายละเอียด",
                  style: Header,
                ),
              ),
            ],
          ),
        ),
        Expanded(
            flex: 2,
            child: ListView(
              children: <Widget>[
                Container(
                  child: DateTimeForm(),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                ),
              ],
            )),
      ],
    );
  }
}

class DateTimeForm extends StatefulWidget {
  @override
  _DateTimeFormState createState() => _DateTimeFormState();
}

class _DateTimeFormState extends State<DateTimeForm> {
  final formKey = GlobalKey<FormState>();
  TextEditingController textDateTime = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BasicDateField(),
            ],
          ),
          Column(
            children: <Widget>[
              RaisedButton(
                color: Colors.amber,
                child: Text(
                  'Reset',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => formKey.currentState.reset(),
              ),
              RaisedButton(
                color: Colors.lightGreenAccent[700],
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => {
                  formKey.currentState.save(),
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BasicDateField extends StatelessWidget {
  final format = DateFormat("dd-MM-yyyy");

//  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
//      color: Colors.white70,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
          width: 2,
        ),
        color: Colors.white70,
      ),
      height: 100,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 2.2,
//        height: 50,
            child: DateTimeField(
              decoration: InputDecoration(
                icon: Icon(
                  Icons.calendar_today,
                  color: Colors.blue,
                ),
                hintText: format.pattern,
              ),
              format: format,
              controller: null,
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ***************************************************************************//
