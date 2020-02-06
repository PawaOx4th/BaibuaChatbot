import 'package:flutter/material.dart';

class MapRoom extends StatefulWidget {
  @override
  _MapRoomState createState() => _MapRoomState();
}

class _MapRoomState extends State<MapRoom> {
  @override
  Widget build(BuildContext context) {
    //? ----------------------------------------------------------- //
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    //? ----------------------------------------------------------- //

    return Scaffold(
      body: Stack(
        children: <Widget>[],
      ),
    );
  }
}
