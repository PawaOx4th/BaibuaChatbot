import 'dart:convert';

import 'package:http/http.dart' as Http;

import 'package:baibuaapp/models/workOfCount.dart';
import 'package:flutter/material.dart';

// State With Provider
class WorkCount with ChangeNotifier {
  int _workCount = 0;

  int get workCount => _workCount;

  WorkCount() {
    fetchConut();
  }

  set workCount(int value) {
    _workCount = value;
    notifyListeners();
  }

  setWorkCount(int lenght) {
    workCount = lenght;
  }

  Future<int> fetchConut() async {
    //
    //
    String url =
        "https://us-central1-newagent-47c20.cloudfunctions.net/api/work/filterGr/76cdcbc7-d542-42b2-9fcd-ef18c7ffff46";

    var res = await Http.get(url);
    print("11111");

    List<dynamic> responJson = jsonDecode(res.body);
    var resMap = responJson.map((m) => WorkofCountModel.fromJson(m)).toList();

    setWorkCount(resMap.length);

    return resMap.length;
  }
}
