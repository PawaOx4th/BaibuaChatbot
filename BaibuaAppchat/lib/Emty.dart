import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Models/Photos.dart';

class Emty_PageNavigation extends StatefulWidget {
  @override
  _Emty_PageNavigationState createState() => _Emty_PageNavigationState();
}

class _Emty_PageNavigationState extends State<Emty_PageNavigation> {
  final String nameTab = "Tranning_01";

  List<String> _list = ['XXX', 'YYY', 'ZZZ'];
  List<Photo> photos ;

  @override
  Widget build(BuildContext context) {
    List<String> _data = ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Title(
            color: Colors.blue,
            child: Text(nameTab),
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      Future<String> photoJson =
                          rootBundle.loadString('asset/photo.json');
                      photoJson.then(
                        (value) {
                          photos = photoFromJson(value);
                          print(photos.length);
                        },
                      );
                    },
                    child: Text("Load Data "),
                  ),
                  RaisedButton(
                    child: Text("Show Data"),
                    onPressed: () {
                      setState(() {});
                    },
                  )
                ],
              ),
              (photos != null)
                  ? Column(
                      children: photos.map((photo) {
                      return Text(photo.title);
                    }).toList())
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
