import 'package:baibuaapp/models/user.dart';
import 'package:baibuaapp/screens/Authenticate/autu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
          routes: {
            '/emty-page': (context) => Emty_PageNavigation(),
          }
//      new MyHomePage(title: 'Baibua Chatbot'),
          ),
    );
  }
}

