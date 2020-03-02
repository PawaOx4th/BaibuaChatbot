import 'dart:convert';
import 'package:baibuaapp/models/worksDetail.dart';
import 'package:http/http.dart' as Http;

class FetchWorkDetial {
  static Future fetchWorkData({String workDetailId}) async {
    String url =
        'https://us-central1-newagent-47c20.cloudfunctions.net/api/work/filterId/$workDetailId';
    print(workDetailId);

    var res = await Http.get(url);
    if (res.statusCode == 200) {
      print("Success : ${res.statusCode}");
      print(res.body);

      Map map = jsonDecode(res.body);
      Work_Detail workDetail = Work_Detail.fromJson(map);
      // List<dynamic> responsJson = jsonDecode(res.body);

      return workDetail;
      // return responsJson.map((m) => new Work_Detail.fromJson(m)).toList();
    } else {
      print(res.statusCode);
      throw Exception('error :(');
    }
  }
}
