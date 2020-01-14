import 'dart:convert';
import 'package:baibuaapp/screens/menu/news/Neweventsetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as Http;

class NewEvent extends StatefulWidget {
  @override
  _NewEventState createState() => _NewEventState();
}

class _NewEventState extends State<NewEvent>
    with SingleTickerProviderStateMixin {
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

  //Color All
  Color iconColor = Color.fromRGBO(173, 197, 219, 1);
  Color borderRole = Color.fromRGBO(0, 147, 233, 1);
  Color bgMenuColor = Color.fromRGBO(237, 242, 247, 1);
  Color ShadowMenuColor = Color.fromRGBO(11, 84, 194, 0.5);
  Color nameColor = Color.fromRGBO(81, 93, 111, 1);
  Color btnSendAdminColor = Color.fromRGBO(166, 188, 208, 1);
  Color btnLogOutColor = Color.fromRGBO(255, 105, 105, 1);

  List cardColor = [
    Color.fromRGBO(60, 73, 92, 1).withOpacity(0.6), //Background Black
    Color.fromRGBO(0, 147, 233, 1).withOpacity(0.6), // Background Blue
    Color.fromRGBO(116, 138, 157, 1).withOpacity(0.6), // Background Gray
  ];

//  Method
  Future<String> getNews() async {
    String _urlNews =
        "https://us-central1-newagent-47c20.cloudfunctions.net/api/news";
    var response = await Http.get(_urlNews);
    setState(() {
      newsData = jsonDecode(response.body);
    });

    return "Success ";
  }

  //Navigator push to Page
  _passarguments(newData,indexS,countColor){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NewEventDetail(
          topic: newsData[indexS]['Topic'],
          description: newsData[indexS]['Description'],
          day: newsData[indexS]['Day'],
          type: newsData[indexS]['Type'],
          id: newsData[indexS]['Id'],
          month: newsData[indexS]['Mouth'],
          year: newsData[indexS]['Year'],
          Colororder: countColor,
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
//    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Column(
            children: <Widget>[
              AppBar(
                title: titleAppbar(),
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
                    child: Row(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.book,
                                color: Color.fromRGBO(166, 188, 208, 1),
                                size: 28,
                              ),
                              onPressed: () {},
                            ),
                            isWork ? working() : Container(),
                          ],
                        ),
                        SizedBox(
                          width: 2.00,
                        ),
                        Stack(
                          children: <Widget>[
                            IconButton(
                              tooltip: "",
                              icon: Icon(
                                Icons.notification_important,
                                color: Color.fromRGBO(166, 188, 208, 1),
                                size: 28,
                              ),
                              onPressed: () {
                                print(height.toString());
                              },
                            ),
                            isWorkDeadline ? workDeadline() : Container(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
//          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    height: MediaQuery.of(context).size.height * 0.83,
                    child: ListView.builder(
                      itemCount: newsData == null ? 0 : newsData.length,
                      itemBuilder: (context, index) {
                        // Set Card Color
                        int countColor = index % 3;

                        //Show News  =>  newsData[index]['Topic'],
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 8.00),
                          height: height * 0.28,
                          child: InkWell(
                            onTap: () => {
//                              print(index + 1),
//                              print(newsData[index]["Description"]),
                              _passarguments(newsData,index,countColor),
                            },
                            child: Card(
                              color: cardColor[countColor],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              elevation: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  image: DecorationImage(
                                    image: NetworkImage(pictureDemo),
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                        cardColor[countColor],
                                        BlendMode.modulate),
                                  ),
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    //Topic
                                    Positioned(
                                      top: 40,
                                      left: 16,
                                      child: Container(
                                          alignment: Alignment.bottomLeft,
                                          width: 300,
                                          height: 80,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              Text(
                                                newsData[index]['Topic'],
                                                style: _googleFontKanit,
                                                maxLines: 3,
                                                textAlign: TextAlign.left,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          )),
                                    ),

                                    //Date
                                    Positioned(
                                      bottom: 20,
                                      left: 16,
                                      child: Container(
                                        width: 300,
                                        height: 50,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "โพสต์เมื่อวันที่  ${newsData[index]['Month']} " +
                                                  " ${newsData[index]['Day']}," +
                                                  " ${newsData[index]['Year']}",
                                              style: _dateFontKanit,
                                            ),
                                            Text(
                                              "ข่าวประชาสัมพันธ์  ${newsData[index]['Type']} ",
                                              style: _typeFontKanit,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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
          "ข่าวสาร",
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
