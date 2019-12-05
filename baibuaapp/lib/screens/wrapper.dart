import 'package:baibuaapp/screens/Emty.dart';
import 'package:baibuaapp/screens/SplashScreen.dart';
import 'package:baibuaapp/models/user.dart';
import 'package:baibuaapp/screens/Authenticate/Login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    //return  either home or Authenticate widget
    if (user == null) {
      return LoginScreen();
    } else {
      return Emty_PageNavigation();
    }
  }
}
