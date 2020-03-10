import 'dart:io';

import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:http/http.dart' as Http;

import 'package:baibuaapp/models/workModel.dart';

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
  String errWorkName = "";
  String errSendDate = "";
  String errWorkDes = "";

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
    textStyle: TextStyle(color: Colors.blueAccent, height: 1.2),
  );

  TextStyle _dateFontKanit = GoogleFonts.kanit(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    textStyle: TextStyle(color: Colors.blue),
  );

  TextStyle _dateFontKanitErr = GoogleFonts.kanit(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    textStyle: TextStyle(color: Colors.redAccent),
  );

  TextStyle _detailFontKanitWhite = GoogleFonts.kanit(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    textStyle: TextStyle(color: Colors.white),
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
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 32,
                ),
                Text(errWorkName, style: _dateFontKanitErr),
                workTopic(),
                SizedBox(
                  height: 14,
                ),
                Text(errSendDate, style: _dateFontKanitErr),
                workDate(),
                SizedBox(
                  height: 14,
                ),
                Text(errWorkDes, style: _dateFontKanitErr),
                workDescription(),
                SizedBox(
                  height: 14,
                ),
                addWorkButton(),
                SizedBox(
                  height: 32,
                ),
              ],
            ),
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
            labelStyle: GoogleFonts.kanit(
              textStyle: TextStyle(color: Colors.blueAccent, fontSize: 16.0),
            ),
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
  Widget workDate() {
    return Container(
      decoration: _boxDecorationInput,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                _workSendDay + "-" + _workSenMount + "-" + _workSendYear,
                style: _dateFontKanit,
              ),
            ],
          ),
          Padding(
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
                style: _googleFontKanit,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //**************************************************************************//
  Widget workDescription() {
    return Container(
      decoration: _boxDecorationInput,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 18),
        child: TextFormField(
          maxLines: 16,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelStyle: _dateFontKanit,
            hintText: "รายละเอียดงาน",
            border: InputBorder.none,
            hintStyle: _dateFontKanit,
          ),
          controller: _workDescription,
        ),
      ),
    );
  }

  //**************************************************************************//
  Widget addWorkButton() {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blueAccent[400]),
        child: Text(
          "ยืนยัน",
          style: _detailFontKanitWhite,
        ),
      ),
      onTap: () async {
        if (_workTopic.text.isNotEmpty &&
            _workSendDay.isNotEmpty &&
            _workDescription.text.isNotEmpty) {
          //////////////////////////////////////////
          var sendWork = WorkModel();
          sendWork.topic = _workTopic.text.trim();
          sendWork.description = _workDescription.text;
          sendWork.createDay = _workCreateDay;
          sendWork.createMonth = _workCreateMount;
          sendWork.createYear = _workCreateYear;
          sendWork.sendDay = _workSendDay;
          sendWork.sendMonth = _workSenMount;
          sendWork.sendYear = _workSendYear;
          sendWork.group = widget.groupId;

          var sendWorkJson = workModelToJson(sendWork);
          print(sendWorkJson);
          ////////////////////////////////////////
          String _url =
              'https://us-central1-newagent-47c20.cloudfunctions.net/api/work';
          var resPonse = await Http.post(
            _url,
            body: sendWorkJson,
            headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          );

          print(resPonse.statusCode.toString());
          print(resPonse.body);
          //////////////////////////////////////////
          if (resPonse.statusCode == 200 || resPonse.statusCode == 201) {
            _showDialogS();
          }
        } else {
          setState(() {
            errWorkName = "กรุณาระบบหัวข้องาน";
            errWorkDes = "กรุณาระบบรายละเอียดงาน";
            errSendDate = "กรุณาระบุวันกำหนดส่ง";
          });
        }
      },
    );
  }

  //** Dialog Show Register Successfully
  _showDialogS() {
    showDialog(
        context: context,
        builder: (_) => NetworkGiffyDialog(
              // key: keys[1],
              image: Image.asset(
                'img/RegisSuccess.gif',
                fit: BoxFit.cover,
              ),
              entryAnimation: EntryAnimation.BOTTOM,
              title: Text(
                'Successfully!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
              ),
              description: Text(
                'เพิ่มงานเข้าสู่ระบบสำเร็จ',
                textAlign: TextAlign.center,
                style: GoogleFonts.kanit(
                  textStyle: TextStyle(color: Colors.black38, fontSize: 14.0),
                ),
              ),
              onOkButtonPressed: () {
                setState(() {
                  _workTopic.clear();
                  _workDescription.clear();
                  _workSendDay = '';
                  _workSenMount = '';
                  _workSendYear = '';
                });
                Navigator.pop(context);
              },
              onlyOkButton: true,
            ));
  }
  // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Widget Section !!!!!!!!!!!!!!!!!!!!!!!!!!
}
