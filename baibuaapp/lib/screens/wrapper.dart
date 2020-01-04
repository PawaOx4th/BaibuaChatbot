import 'package:baibuaapp/screens/baibuaChatroom.dart';
import 'package:baibuaapp/screens/emty.dart' show Emty_PageNavigation;
import 'package:baibuaapp/screens/splashscreen.dart';
import 'package:baibuaapp/models/user.dart' show User;
import 'package:baibuaapp/screens/Authenticate/login.dart' show LoginScreen;
import 'package:flutter/material.dart' show BuildContext, StatelessWidget, Widget;
import 'package:provider/provider.dart' show Provider;

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    //return  either home or Authenticate widget
    if (user == null) {
      return LoginScreen();
    } else {
      return ChatroomBaibua();
    }
  }
}
