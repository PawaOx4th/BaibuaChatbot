import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AddWork extends StatefulWidget {
  AddWork({Key key, this.groupId}) : super(key: key);

  final String groupId;

  @override
  _AddWorkState createState() => _AddWorkState();
}

class _AddWorkState extends State<AddWork> {
  //Variable
  final bool isWork = true;
  final bool isWorkDeadline = true;
  String iD = '';
  String _countWorking = "2";
  String _countWorkDeadline = "20";

  TextEditingController _workTopic = TextEditingController();
  TextEditingController _workDescription = TextEditingController();
  String _workCreateDay = "";
  String _workCreateMount = "";
  String _workCreateYear = "";
  String _workSendDay = "";
  String _workSenMount = "";
  String _workSendYear = "";

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

//BoxDecoration Style
  BoxDecoration _boxDecorationInput = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10.0),
  );

  Color bgMenuColor = Color.fromRGBO(237, 242, 247, 1);

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgMenuColor,
        appBar: customsAppBar(context),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 32,
              ),
              workTopic(),
              SizedBox(
                height: 14,
              ),
              workDiscription(),
              SizedBox(
                height: 14,
              ),
              Placeholder(),
              SizedBox(
                height: 14,
              ),
              Placeholder(),
              SizedBox(
                height: 14,
              ),
              Placeholder(),
              SizedBox(
                height: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Widget Section !!!!!!!!!!!!!!!!!!!!!!!!!!
  //**************************************************************************//
  Widget customsAppBar(context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: Column(
        children: <Widget>[
          AppBar(
            centerTitle: true,
            title: Text(
              "เพิ่มงาน",
              style: _googleFontKaniTitle,
              // softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
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
          ),
        ],
      ),
    );
  }

  //**************************************************************************//
  Widget workTopic() {
    return Container(
      decoration: _boxDecorationInput,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 18),
        child: TextFormField(
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: "รายละเอียดงาน",
            border: InputBorder.none,
            hintStyle: GoogleFonts.kanit(
              textStyle: TextStyle(color: Colors.black38, fontSize: 16.0),
            ),
          ),
          controller: _workTopic,
        ),
      ),
    );
  }

  //**************************************************************************//
  Widget workDiscription() {
    return Container(
      decoration: _boxDecorationInput,
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 18),
          child: FlatButton(
            onPressed: () {
              DatePicker.showDatePicker(context, showTitleActions: true,
                  onConfirm: (date) {
                // ** SET DATE CREATE AND SEND WORKS
                setState(
                  () {
                    // ** Send Work
                    _workSendDay = date.day.toString();
                    _workSenMount = date.month.toString();
                    _workSendYear = date.year.toString();

// ** Create Work
                    _workCreateDay = DateTime.now().day.toString();
                    _workCreateMount = DateTime.now().month.toString();
                    _workCreateYear = DateTime.now().year.toString();
                  },
                );
              }, currentTime: DateTime.now(), locale: LocaleType.th);
            },
            child: Text(
              'เลือกกำหนดวันที่ส่ง',
              style: TextStyle(color: Colors.blue),
            ),
          )),
    );
  }

  // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Widget Section !!!!!!!!!!!!!!!!!!!!!!!!!!
}
