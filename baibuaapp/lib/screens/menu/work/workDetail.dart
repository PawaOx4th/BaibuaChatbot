import 'package:baibuaapp/REST%20API/fetchWorkDetial.dart';
import 'package:baibuaapp/Widgets/customAppBar.dart';
import 'package:baibuaapp/models/statWorkCount.dart';
import 'package:baibuaapp/models/worksDetail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WorkDetail extends StatefulWidget {
  WorkDetail({Key key, this.workId}) : super(key: key);

  final String workId;

  @override
  _WorkDetailState createState() => _WorkDetailState();
}

class _WorkDetailState extends State<WorkDetail> {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (_) => WorkCount(),
        child: Scaffold(
          appBar: customsAppBar(context),
          body: Detail(
            workDetailId: widget.workId,
          ),
        ),
      ),
    );
  }

  //~ Widget
  Widget customsAppBar(context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: Column(
        children: <Widget>[CustomAppBarr('รายละเอียดงาน')],
      ),
    );
  }
}

class Detail extends StatefulWidget {
  const Detail({Key key, this.workDetailId}) : super(key: key);

  final String workDetailId;

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    var picUrl =
        'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1082&q=80';

    //? ----------------------------------------------- //
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double height2 = height * 2;
    //? ----------------------------------------------- //

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        width: width,
        height: height2,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              top: 0,
              child: Container(
                width: width,
                height: height / 1.8,
                // color: Colors.pink[200],
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(picUrl),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.blue[100],
                      BlendMode.modulate,
                    ),
                  ),
                ),
              ),
            ),

            //** Section Data */
            Positioned(
              top: 250,
              // height: 1000,

              child: Container(
                width: width,
                height: height * 1.8,
                // color: Colors.orange,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.blue,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      DataDatail(
                        workDetailId: widget.workDetailId,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//* ************************************** DataDatail ************************************ **/
class DataDatail extends StatefulWidget {
  const DataDatail({Key key, this.workDetailId}) : super(key: key);

  final String workDetailId;

  @override
  _DataDatailState createState() => _DataDatailState();
}

class _DataDatailState extends State<DataDatail> {
  @override
  Widget build(BuildContext context) {
    //? ----------------------------------------------- //
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double height2 = height * 2;
    //? ----------------------------------------------- //

    //TextStyle 👺👺
    TextStyle _workName = GoogleFonts.kanit(
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
      textStyle: TextStyle(
        color: Colors.white,
      ),
    );
    TextStyle _workDetail = GoogleFonts.kanit(
      fontSize: 18.0,
      // fontWeight: FontWeight.bold,
      textStyle: TextStyle(
        color: Colors.white,
      ),
    );
    TextStyle _menu = GoogleFonts.kanit(
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      textStyle: TextStyle(
        color: Colors.black,
      ),
    );

    return Container(
      width: width,
      height: height,
      // color: Colors.redAccent,
      child: ListView(
        children: <Widget>[
          FutureBuilder(
            future: FetchWorkDetial.fetchWorkData(
                workDetailId: widget.workDetailId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Work_Detail workDetail = snapshot.data;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //** Icon..
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.account_circle,
                        size: 64,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //**  Topic..
                    Text(
                      workDetail.topic,
                      style: _workName,
                      overflow: TextOverflow.ellipsis,
                    ),

                    //**  SendDate..
                    Text(
                      "กำหนดส่ง: ${workDetail.sendDate[0]} ${workDetail.sendDate[1]} ${workDetail.sendDate[2]}",
                      style: _workDetail,
                    ),
                    Text(
                      "สั่งเมื่อ: ${workDetail.createDate[0]} ${workDetail.createDate[1]} ${workDetail.createDate[2]}",
                      style: _workDetail,
                    ),
                    SizedBox(
                      height: 36.00,
                    ),
                    Text(
                      "รายละเอียด",
                      style: _menu,
                    ),
                    Text(
                      workDetail.description,
                      style: _workDetail,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 9,
                    ),
                  ],
                );
              } else {
                return Center(
                    child: CircularProgressIndicator(
                  backgroundColor: Colors.transparent,
                ));
              }
            },
          )
        ],
      ),
    );
  }
}
//* *********************************************************************************** **/
