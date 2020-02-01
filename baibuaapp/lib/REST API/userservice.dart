import 'dart:convert';

import 'package:baibuaapp/REST%20API/userdata.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as Http;

class UserDataService {
  static Future<Userdata> callData({String userID}) async {
    print(userID);

    var url =
        "https://us-central1-newagent-47c20.cloudfunctions.net/api/user/filterId/${userID}";
    var response = await Http.get(url);

    if (response.statusCode == 200) {
      Map map = jsonDecode(response.body);
      Userdata userData = Userdata.fromJson(map);
      print(
          "User : ${userData.id} \n Name: ${userData.nameEn} \n Email: ${userData.email}");
      return userData;
    } else {
      print(response.statusCode.toString());
    }
  }
}
