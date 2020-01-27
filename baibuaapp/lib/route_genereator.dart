import 'package:baibuaapp/google_assistant.dart';
import 'package:baibuaapp/screens/Authenticate/login.dart';
import 'package:baibuaapp/screens/Bottomnavigation.dart';
import 'package:baibuaapp/screens/emty.dart';
import 'package:baibuaapp/screens/menu/Group.dart';
import 'package:baibuaapp/screens/menu/baibuaChatroom.dart';
import 'package:baibuaapp/screens/menu/mainmenu.dart';
import 'package:baibuaapp/screens/menu/news/Newevent.dart';
import 'package:baibuaapp/screens/menu/news/Neweventsetail.dart';
import 'package:baibuaapp/screens/menu/userdetail.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/Chatroom-page':
        return MaterialPageRoute(builder: (_) => ChatroomBaibua());
      case '/Mainmenu-page':
        return MaterialPageRoute(builder: (_) => Mainmenu());
      case '/Login-page':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/emty-page':
        return MaterialPageRoute(builder: (_) => Emty_PageNavigation());
      case "/Userdetail-page":
        return MaterialPageRoute(builder: (_) => UserDetailPage());
      case '/Newevent-page':
        return MaterialPageRoute(builder: (_) => NewEvent());
      case '/Neweventdetail-page':
        return MaterialPageRoute(
            builder: (_) => NewEventDetail(
                  topic: args,
                  description: args,
                  month: args,
                  id: args,
                  type: args,
                  day: args,
                  year: args,
                ));
      case '/Group-page':
        return MaterialPageRoute(builder: (_) => Group());
      case '/Bottomnavigation-page':
        return MaterialPageRoute(
            builder: (_) => BottomNavigation(
                  page: args,
                ));
      case '/Googleasistant-page':
        return MaterialPageRoute(builder: (_) => GoogleAssistant());
//      case '/onepage':
//      // Validation of correct data type
//        if (args is String) {
//          return MaterialPageRoute(
//            builder: (_) => OnePage(
//              datas: args,
//
//            ),
//          );
//        }
//        // If args is not of the correct type, return an error page.
//        // You can also throw an exception while in development.
//        return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
