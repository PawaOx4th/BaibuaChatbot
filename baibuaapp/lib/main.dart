import 'package:baibuaapp/models/user.dart';
import 'package:baibuaapp/screens/Authenticate/autu.dart';
import 'package:baibuaapp/screens/Authenticate/login.dart';
import 'package:baibuaapp/screens/Menu/news.dart';
import 'package:baibuaapp/screens/Menu/setting.dart';
import 'package:baibuaapp/screens/addwork.dart';
import 'package:baibuaapp/screens/baibuaChatroom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
            '/Login-page': (context) => LoginScreen(),
            '/emty-page': (context) => Emty_PageNavigation(), // test-page
            '/Chatroom-page': (context) => ChatroomBaibua(), // ChatRooms
            '/News-page': (context) => News(), //News
            '/Setting-page': (context) => Setting_Page(),//Setting
            '/AddWork-page': (context) => AddworkPage(),//Addwork Page
          },
        localizationsDelegates: [
          // ... app-specific localization delegate[s] here
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en'), // English
          const Locale('es'), // Spanish
          const Locale('fr'), // French
          const Locale('zh'), // Chinese
        ],
//      new MyHomePage(title: 'Baibua Chatbot'),
          ),
    );
  }
}
