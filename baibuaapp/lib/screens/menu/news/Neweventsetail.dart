import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewEventDetail extends StatefulWidget {
  NewEventDetail(
      {Key key,
      this.topic,
      this.description,
      this.month,
      this.id,
      this.day,
      this.type,
      this.year,
      this.Colororder})
      : super(key: key);

  // Topic, Month, Day, Year, Type, Description, Id
  final String topic;

  final String month;

  final String day;

  final String year;

  final String type;

  final String description;

  final String id;

  final int Colororder;

  @override
  _NewEventDetailState createState() => _NewEventDetailState();
}

class _NewEventDetailState extends State<NewEventDetail> {
  var pictureDemo =
      "https://images.unsplash.com/photo-1523240795612-9a054b0db644?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80";

  //TextStyle
  TextStyle _descriptionFontKaniTitle = GoogleFonts.kanit(
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
    textStyle: TextStyle(
      color: Colors.white,
    ),
  );

  TextStyle _googleFontKanit = GoogleFonts.kanit(
    fontSize: 22.0,
    fontWeight: FontWeight.w900,
    textStyle: TextStyle(color: Colors.white),
  );

  TextStyle _dateFontKanit = GoogleFonts.kanit(
    fontSize: 16.0,
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

  Color descriptionColor = Color.fromRGBO(60, 73, 92, 1);

  List cardColor = [
    Color.fromRGBO(60, 73, 92, 1).withOpacity(0.6),
    //Background Black
    Color.fromRGBO(0, 147, 233, 1).withOpacity(0.6),
    // Background Blue
    Color.fromRGBO(116, 138, 157, 1).withOpacity(0.6),
    // Background Gray // Background Gray
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    double hightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    print(widget.month);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: hightScreen,
            width: widthScreen,
            decoration: BoxDecoration(
              color: descriptionColor,
            ),
            child: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      // Title Section
                      Container(
                        height: hightScreen * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.00),
                            bottomRight: Radius.circular(30.00),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(pictureDemo),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                cardColor[widget.Colororder],
                                BlendMode.modulate),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  // **********************Clear Button************************//
                                  InkWell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      width: 30,
                                      height: 30,
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.clear,
                                        size: 22.0,
                                      ),
                                    ),
                                    onTap: () {
                                      print('Clear');
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  SizedBox(
                                    width: 16.00,
                                  ),
                                ],
                              ),
                              flex: 1,
                            ),

                            //*****************************Topic and Date****************************//
                            Expanded(
                              flex: 4,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Hero(
                                      tag: widget.topic,
                                      child: Text(
                                        widget.topic,
                                        style: _googleFontKanit,
                                        maxLines: 3,
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.00,
                                    ),
                                    Text(
                                      "โพสต์เมื่อวันที่  ${widget.month} ${widget.day}, ${widget.year}",
                                      style: _dateFontKanit,
                                    ),
                                    Text(
                                      "ข่าวประชาสัมพันธ์ / ${widget.type}",
                                      style: _typeFontKanit,
                                    ),
                                    SizedBox(
                                      height: 30.00,
                                    ),
//                                    Text(widget.description),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.00,
                      ),
                      //*********************************** Description Section *************************//
                      SingleChildScrollView(
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 26.00),
                          child: Container(
//                            height: hightScreen * 0.5,
                            child:
//                            Placeholder()
                                Text(
                              widget.description,
                              style: _descriptionFontKaniTitle,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 50.00,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
