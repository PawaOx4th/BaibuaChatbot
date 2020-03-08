import 'dart:convert';

import 'package:baibuaapp/models/group.dart';
import 'package:baibuaapp/models/groupMpdel.dart';

import 'package:http/http.dart' as Http;

class AllSubject {
  //~ *************************************************************************************************** //
  static Future<List<GroupModel>> getAllGroup({String userId}) async {
    String url =
        'https://us-central1-newagent-47c20.cloudfunctions.net/api/group/filterStudentId/$userId';
    var res = await Http.get(url);
    // print(res.body);
    if (res.statusCode == 200) {
      print("Status Code : ${res.statusCode}");

      List<dynamic> responseJson = jsonDecode(res.body);
      // print(responseJson);
      return responseJson.map((m) => new GroupModel.fromJson(m)).toList();
    } else {
      throw Exception('error :(');
    }
  }
  //~ *************************************************************************************************** //

  static Future<List<Group>> getGroup() async {
    String urlG =
        "https://us-central1-newagent-47c20.cloudfunctions.net/api/group";

    var responseGroup = await Http.get(urlG);
    //
    if (responseGroup == 200) {
      print("Status Code get Group : ${responseGroup.statusCode}");

      List<dynamic> groupJson = jsonDecode(responseGroup.body);
      return groupJson.map((val) => new Group.fromJson(val)).toList();
    } else {
      throw Exception('error :(');
    }
  }
}
