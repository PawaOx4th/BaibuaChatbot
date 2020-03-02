import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as Http;

import 'package:baibuaapp/models/workOfCount.dart';
import 'package:flutter/material.dart';

// State With Provider
class WorkCount with ChangeNotifier {
  int _workCount = 0;

  int get workCount => _workCount;

  WorkCount() {
    findDisplay();
  }

  set workCount(int value) {
    _workCount = value;
    notifyListeners();
  }

  setWorkCount(int lenght) {
    workCount = lenght;
  }

  Future<void> findDisplay() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    String name = firebaseUser.displayName;
    fetchConut(userId: name);
  }

  Future<int> fetchConut({String userId}) async {
    //
    //
    String url =
        "https://us-central1-newagent-47c20.cloudfunctions.net/api/work/filterNm/${userId}";

    var res = await Http.get(url);
    print("11111");

    Map map = jsonDecode(res.body);

    WorkofCountModel workofCountModel = WorkofCountModel.fromJson(map);

    setWorkCount(workofCountModel.data);

    return workofCountModel.data;
  }
}
