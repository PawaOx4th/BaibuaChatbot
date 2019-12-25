import 'package:flutter/material.dart';

class Groupselected extends StatefulWidget {
  @override
  _GroupselectedState createState() => _GroupselectedState();
}

class _GroupselectedState extends State<Groupselected> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(
                Icons.add_circle,
                size: 30,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SafeArea(
//        child: ,
      ),
    );
  }

  Widget CardSubject() {
    return Container(
//      width: Me,
      child: Card(
        color: Colors.pinkAccent,
      ),
    );
  }
}
