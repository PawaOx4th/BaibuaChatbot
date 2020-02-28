import 'package:baibuaapp/models/statWorkCount.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationAlert extends StatelessWidget {
  TextStyle _countwork =
      TextStyle(color: Colors.white70, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.0),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 2.00,
          ),
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.notification_important,
                  color: Color.fromRGBO(166, 188, 208, 1),
                  size: 28,
                ),
                onPressed: () {},
              ),
              workDeadline(),
            ],
          ),
        ],
      ),
    );
  }

  //Widget  work Deadline
  Widget workDeadline() {
    return Consumer<WorkCount>(
      builder: (BuildContext context, WorkCount value, _) => Positioned(
        bottom: 5,
        left: 0,
        child: Container(
          alignment: Alignment.center,
          width: 30,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Text(
            "${value.workCount}",
            style: _countwork,
          ),
        ),
      ),
    );
  }
}
