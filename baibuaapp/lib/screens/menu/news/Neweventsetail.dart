import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewEventDetail extends StatefulWidget {
  NewEventDetail(
      {Key key,
      this.topic,
      this.description,
      this.month,
      this.id,
      this.day,
      this.type,
      this.year})
      : super(key: key);

  // Topic, Month, Day, Year, Type, Description, Id
  final String topic;

  final String month;

  final String day;

  final String year;

  final String type;

  final String description;

  final String id;

  @override
  _NewEventDetailState createState() => _NewEventDetailState();
}

class _NewEventDetailState extends State<NewEventDetail> {
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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: hightScreen,
            width: widthScreen,
            decoration: BoxDecoration(color: Colors.grey[400]),
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
                          color: Colors.red,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  // Clear Button
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

                            //Topic and Date
                            Expanded(

                              flex: 4,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(widget.topic),
                                    SizedBox(height: 8.00,),
                                    Text(widget.description),

                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      // Description Section
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Placeholder(),
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
