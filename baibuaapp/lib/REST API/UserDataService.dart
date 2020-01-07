import 'dart:convert';
import 'package:baibuaapp/REST%20API/userdata.dart';
import 'package:http/http.dart' as Http;

class UserDataService {
  static Future<UserData> callData() async {
    var url = "https://us-central1-newagent-47c20.cloudfunctions.net/api/user/1159104003382";
    var response = await Http.get(url);
    Map map = json.decode(response.body);
    UserData  userData = UserData.fromJson(map);
    print(userData.id);
    return userData ;


  }
}