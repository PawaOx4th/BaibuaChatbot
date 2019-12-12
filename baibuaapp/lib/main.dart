import 'package:baibuaapp/models/user.dart';
import 'package:baibuaapp/screens/Authenticate/Autu.dart';
import 'package:baibuaapp/screens/Authenticate/Login.dart';
import 'package:baibuaapp/screens/BaibuaChatroom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/Pagefortest.dart';
import 'screens/Splashscreen.dart';

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
          routes: {
            '/Login-page': (context) => LoginScreen(),
            '/emty-page': (context) => Pagefortest(), // test-page
            '/Chatroom-page': (context) => ChatroomBaibua(), // ChatRooms
//            '/News-page': (context) => News(),
          }
//      new MyHomePage(title: 'Baibua Chatbot'),
          ),
    );
  }
}
