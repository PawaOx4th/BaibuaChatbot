import 'dart:convert';

import 'package:http/http.dart' as Http;
import 'package:baibuaapp/models/workInGroup.dart';

class FetchWork {
  static Future<List<WorkInGroup>> fecthwork({String subjectId}) async {
    String _url =
        'https://us-central1-newagent-47c20.cloudfunctions.net/api/work/filterGr/$subjectId';

    var res = await Http.get(_url);
    if (res.statusCode == 200) {
      print("Call API Success");

      List<dynamic> responsJson = jsonDecode(res.body);
      print(res.statusCode);

      return responsJson.map((m) => new WorkInGroup.fromJson(m)).toList();
    } else {
      print(res.statusCode);
      throw Exception('error :(');
    }
  }
}
