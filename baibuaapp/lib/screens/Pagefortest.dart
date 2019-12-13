import 'dart:convert';

import 'package:baibuaapp/api/Note.dart';
import 'package:baibuaapp/api/apitest.dart';
import 'package:baibuaapp/models/Apitestmodel.dart';
import 'package:baibuaapp/screens/Authenticate/Login.dart';
import 'package:baibuaapp/screens/Authenticate/Autu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Pagefortest extends StatefulWidget {
  @override
  _PagefortestState createState() => _PagefortestState();
}

// ignore: camel_case_types
class _PagefortestState extends State<Pagefortest> {
  final String nameTab = "Main Screen";
  final AuthService _authService = AuthService();

  List<Apitestmodel> list = List();

//  ********************************************************************************
//  Section Test API fetchData

  List<Note> _notes = List<Note>();

  // ignore: missing_return
  Future<List<Note>> fetchNotes() async {
    var url =
        'https://raw.githubusercontent.com/boriszv/json/master/random_example.json';
//    var url = 'https://10.118.1.171:1010/users';
    var response = await http.get(url);

    var notes = List<Note>();

    try {
      if (response.statusCode == 200) {
        var noteJson = json.decode(response.body);
        for (var noteJson in noteJson) {
          notes.add(Note.fromJson(noteJson));
        }
      }
      return notes;
    } catch (e) {
      print(e.toString());
    }
  }

//  ********************************************************************************

//  List<String> _list = ['XXX', 'YYY', 'ZZZ'];

  @override
  void initState() {
    fetchNotes().then((val) {
      setState(() {
        _notes.addAll(val);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: Text(nameTab),
          backgroundColor: Colors.lightBlueAccent,
          elevation: 5,
          actions: <Widget>[
//           Logout Button
            FlatButton.icon(
              icon: Icon(
                Icons.person,
              ),
              label: Text('Logout'),
              onPressed: () async {
                await _authService.signOut(); // Method Log Out
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          ],
        ),
        body: ListView.builder(
              scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: _notes.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _notes[index].title == null ? '' : _notes[index].title,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
