import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Group extends StatelessWidget {
  const Group({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: Stack(),
        ),
      ),
    );
  }
}
