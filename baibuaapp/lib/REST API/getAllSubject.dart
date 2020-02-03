import 'dart:convert';

import 'package:baibuaapp/models/groupMpdel.dart';
import 'package:http/http.dart' as Http;

class AllSubject {
  static Future<List<GroupModel>> getAllGroup({String userId}) async {
    String url =
        'https://us-central1-newagent-47c20.cloudfunctions.net/api/group/filterStudentId/${userId}';
    var res = await Http.get(url);
    // print(res.body);
    if (res.statusCode == 200) {
      print("Status Code : ${res.statusCode}");
      // print(res.body);
      List<dynamic> responseJson = jsonDecode(res.body);
      return responseJson.map((m) => new GroupModel.fromJson(m)).toList();
    } else {
      throw Exception('error :(');
    }
  }
}
