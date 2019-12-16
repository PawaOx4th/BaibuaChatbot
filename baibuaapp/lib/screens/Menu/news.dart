import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
//  Color colorSetting = const Color.fromRGBO(241, 249, 255, 1);

  bool val1 = false;
  bool val2 = false;
  bool val3 = false;
  bool val4 = false;

  List<String> _evantName = [
    'กิจกรรม กรอ/กยศ',
    'กิจกรรมวิชาการ',
    'กิจกรรมบำเพ็ญประโยชน์',
    'กิจกรรมคณะ / วิทยาลัย'
  ];

  void onSelectValue1(bool val) {
    setState(() {
      val1 = val;
    });
    (val) ? print("select: กยส / กรอ") : null;
  }

  void onSelectValue2(bool val) {
    setState(() {
      val2 = val;
    });
    (val) ? print("select:" + _evantName[1]) : null;
  }

  void onSelectValue3(bool val) {
    setState(() {
      val3 = val;
    });
    (val) ? print("select:" + _evantName[2]) : null;
  }

  void onSelectValue4(bool val) {
    setState(() {
      val4 = val;
    });
    (val) ? print("select:" + _evantName[3]) : null;
  }

  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width * 100;

    TextStyle Headline = TextStyle(

      fontWeight: FontWeight.bold,
      fontSize: 32,
      color: Colors.white,
    );

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 8.0, color: Colors.lightBlue))),
              width: fullWidth,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "เลือกรับประเภทข่าวสาร",
                    style: TextStyle(

                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(
                      height: 10.0,
                    ),
//                    Event Select 1
                    Container(
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                        height: MediaQuery.of(context).size.height * 0.13,
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 8,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    _evantName[0],
                                    style: TextStyle(

                                      fontSize: 20,
                                    ),
                                  ),
                                  Switch(
                                    activeColor: Colors.lightBlueAccent[400],
                                    value: val1,
                                    onChanged: onSelectValue1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //                    Event Select 2
                    Container(
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                        height: MediaQuery.of(context).size.height * 0.13,
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 8,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    _evantName[1],
                                    style: TextStyle(

                                      fontSize: 20,
                                    ),
                                  ),
                                  Switch(
                                    activeColor: Colors.lightBlueAccent[400],
                                    value: val2,
                                    onChanged: onSelectValue2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //                    Event Select 3
                    Container(
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                        height: MediaQuery.of(context).size.height * 0.13,
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 8,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    _evantName[2],
                                    style: TextStyle(

                                      fontSize: 20,
                                    ),
                                  ),
                                  Switch(
                                    activeColor: Colors.lightBlueAccent[400],
                                    value: val3,
                                    onChanged: onSelectValue3,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //                    Event Select 4
                    Container(
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                        height: MediaQuery.of(context).size.height * 0.13,
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 8,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    _evantName[3],
                                    style: TextStyle(

                                      fontSize: 20,
                                    ),
                                  ),
                                  Switch(
                                    activeColor: Colors.lightBlueAccent[400],
                                    value: val4,
                                    onChanged: onSelectValue4,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
