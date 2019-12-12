import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:baibuaapp/models/Apitestmodel.dart';
import 'package:http/http.dart' as http;

class testapi {
  Future<Apitestmodel> test() async {

    String url = "http://192.168.20.142:1010/users/1159104003432/";
    try {
      http.Response res = await http
          .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

      Map mapData = jsonDecode(res.body);
      Apitestmodel apitestmodel = Apitestmodel.fromJson(mapData);

      print("ID: " + apitestmodel.userId);
//      print("Password: " + apitestmodel.password);
//      print("Frist name: " + apitestmodel.firstname);
//      print("Last Name: " + apitestmodel.lastname);
//      print("E-mail: " + apitestmodel.email);
    } catch (e) {
      print(e.toString());
    }
  }
}
