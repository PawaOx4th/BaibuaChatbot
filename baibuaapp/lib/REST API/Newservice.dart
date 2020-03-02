import 'dart:convert';
import 'package:baibuaapp/models/Newmodel.dart';
import 'package:http/http.dart' as Http;

class NewsService {
  Future<List<NewModel>> getAllNews() async {
    
    String _urlAllNews =
        "https://us-central1-newagent-47c20.cloudfunctions.net/api/news";

    var response = await Http.get(_urlAllNews);
    List<dynamic> list = jsonDecode(response.body);
    // 
    for (int i = 0; i < list.length; i++) {
      NewModel newModel = NewModel.fromJson(list[i]);
      print(newModel.id);
    }
    // 

    
  }
}
