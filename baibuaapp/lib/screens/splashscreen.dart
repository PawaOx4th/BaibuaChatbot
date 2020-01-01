import 'dart:async';
import 'package:baibuaapp/screens/wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    Timer(Duration(seconds: 5), () {
//      Navigator.push(
//        context,
////        MaterialPageRoute(builder: (context) => ChatroomBaibua()),
//        MaterialPageRoute(builder: (context) => Wrapper()),
//      );
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('img/splashscreenbg.png'),
                fit: BoxFit.cover,

              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
//              Expanded(
//                flex: 5,
//                child: Container(
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      CircleAvatar(
//                        backgroundColor: Colors.white,
//                        radius: 50.0,
//                        child: Icon(
//                          Icons.track_changes,
//                          color: Colors.lightBlueAccent,
//                          size: 60.0,
//                        ),
//                      ),
//                      Padding(
//                        padding: EdgeInsets.only(top: 10.0),
//                      ),
//                      Text(
//                        "Baibua",
//                        style: TextStyle(
//                          fontSize: 32.0,
//                          color: Colors.white,
//                          fontWeight: FontWeight.bold,
//                        ),
//                      ),
//
//                    ],
//                  ),
//                ),
//              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      "Create by K2B Project",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
