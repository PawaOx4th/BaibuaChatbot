
import 'package:baibuaapp/models/user.dart';
import 'package:baibuaapp/screens/Authenticate/autu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/baibuaChatroom.dart';
import 'screens/emty.dart';
import 'screens/SplashScreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Example Dialogflow Flutter',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new SplashScreen(),
        routes: {'/emty-page' : (context) => Emty_PageNavigation()}
//      new MyHomePage(title: 'Baibua Chatbot'),
      ),
    );
  }
}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => new _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text(widget.title),
//      ),
//      body: new Column(children: <Widget>[
////        new Container(
////          margin: EdgeInsets.all(10.0),
////          child: new RaisedButton(
////            onPressed: () {
////              Navigator.push(
////                context,
////                MaterialPageRoute(builder: (context) => PageDialogflowV1()),
////              );
////            },
////            child: Text("Dialogflow v1"),
////          ),
////        ),
//        new Container(
//          margin: EdgeInsets.all(10.0),
//          child: new RaisedButton(
//            onPressed: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(builder: (context) => ChatroomBaibua()),
//              );
//            },
//            child: Text("CHATROOM"),
//          ),
//        ),
////        new Container(
////          margin: EdgeInsets.all(10.0),
////          child: new RaisedButton(
////            onPressed: () {
////              Navigator.push(
////                context,
////                MaterialPageRoute(builder: (context) => GoogleAssistant()),
////              );
////            },
////            child: Text("GoogleAssistant"),
////          ),
////        )
//      ]),
//    );
//  }
//}
