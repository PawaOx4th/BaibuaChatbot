import 'dart:convert';

import 'package:baibuaapp/models/statWorkCount.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as Http;
import 'package:baibuaapp/models/workOfCount.dart';
import 'package:provider/provider.dart';

class WorkOfCount {
  static Future<int> fetchConut() async {
    //
    //
    String url =
        "https://us-central1-newagent-47c20.cloudfunctions.net/api/work/filterGr/76cdcbc7-d542-42b2-9fcd-ef18c7ffff46";

    var res = await Http.get(url);
    print("11111");

    List<dynamic> responJson = jsonDecode(res.body);
    var resMap = responJson.map((m) => WorkofCountModel.fromJson(m)).toList();

    addData(count: resMap.length);

    print(resMap.length);

    return resMap.length;
  }

  static addData({int count}) {
    WorkCount workCounts = WorkCount();
    workCounts.workCount = count;
  }
}
