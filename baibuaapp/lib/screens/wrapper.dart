
import 'package:baibuaapp/models/user.dart';
import 'package:baibuaapp/screens/Authenticate/Login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user =  Provider.of<User>(context);
    print(user);

    //return  either home or Authenticate widget
    return LoginScreen();
  }
}
