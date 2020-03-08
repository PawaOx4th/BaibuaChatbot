import 'dart:convert';

import 'package:http/http.dart' as Http;
import 'package:baibuaapp/models/group.dart';

class GetGroup {
  static Future<List<Group>> getGroup() async {
    String urlG =
        "https://us-central1-newagent-47c20.cloudfunctions.net/api/group";

    var responseGroup = await Http.get(urlG);
    //
    if (responseGroup.statusCode == 200) {
      print("Status Code get Group : ${responseGroup.statusCode}");

      List<dynamic> groupJson = jsonDecode(responseGroup.body);
      return groupJson.map((val) => new Group.fromJson(val)).toList();
    } else {
      throw Exception('error :(');
    }
  }
}
