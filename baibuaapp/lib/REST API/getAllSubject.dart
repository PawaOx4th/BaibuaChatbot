import 'dart:convert';

import 'package:baibuaapp/models/groupMpdel.dart';
import 'package:baibuaapp/models/workInGroup.dart';
import 'package:http/http.dart' as Http;

class AllSubject {
  //~ *************************************************************************************************** //
  static Future<List<GroupModel>> getAllGroup({String userId}) async {
    String url =
        'https://us-central1-newagent-47c20.cloudfunctions.net/api/group/filterStudentId/${userId}';
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

  // static Stream<List<GroupModel>> getAllGroupWithStream(
  //     {String userId}) async* {
  //   String url =
  //       'https://us-central1-newagent-47c20.cloudfunctions.net/api/group/filterStudentId/${userId}';
  //   var res = await Http.get(url);
  //   // print(res.body);
  //   if (res.statusCode == 200) {
  //     print("Status Code : ${res.statusCode}");

  //     List<dynamic> responseJson = jsonDecode(res.body);
  //     // print(responseJson);
  //     yield responseJson.map((m) => new GroupModel.fromJson(m)).toList();
  //   } else {
  //     throw Exception('error :(');
  //   }
  // }
}
