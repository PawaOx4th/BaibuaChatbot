import 'dart:convert';

import 'package:baibuaapp/REST%20API/userdata.dart';
import 'package:http/http.dart' as Http;

class UserDataService {
  static Future<Userdata> callData({String userID}) async {
    var url = "https://us-central1-newagent-47c20.cloudfunctions.net/api/user/${userID}";
    var response = await Http.get(url);
    Map map = jsonDecode(response.body);
    Userdata userData = Userdata.fromJson(map);
    print(
        "User : ${userData.id} \n Name: ${userData.nameEn} \n Email: ${userData.email}");
    return userData ;
  }

//  static Future<UserData> callDataWithEmail(String email) async {
//    var url = "https://us-central1-newagent-47c20.cloudfunctions.net/api/user/$email";
//    var response = await Http.get(url);
//    Map map = jsonDecode(response.body);
//    UserData userData = UserData.fromJson(map);
//    print(
//        "Get data With Email: ${userData.email}");
//    return userData ;
//  }

}
