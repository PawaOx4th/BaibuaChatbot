
import 'package:flutter/material.dart';
import 'BaibuaChatroom.dart';
import 'Emty.dart';
import 'SplashScreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Example Dialogflow Flutter',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SplashScreen(),
      routes: {'/emty-page' : (context) => Emty_PageNavigation()},
//      new MyHomePage(title: 'Baibua Chatbot'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Column(children: <Widget>[
//        new Container(
//          margin: EdgeInsets.all(10.0),
//          child: new RaisedButton(
//            onPressed: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(builder: (context) => PageDialogflowV1()),
//              );
//            },
//            child: Text("Dialogflow v1"),
//          ),
//        ),
        new Container(
          margin: EdgeInsets.all(10.0),
          child: new RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatroomBaibua()),
              );
            },
            child: Text("CHATROOM"),
          ),
        ),
//        new Container(
//          margin: EdgeInsets.all(10.0),
//          child: new RaisedButton(
//            onPressed: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(builder: (context) => GoogleAssistant()),
//              );
//            },
//            child: Text("GoogleAssistant"),
//          ),
//        )
      ]),
    );
  }
}
