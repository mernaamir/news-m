import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/models/newsResponse.dart';
import 'package:newsapp/models/responseSource.dart';
import 'package:newsapp/screens/category.dart';
import 'package:newsapp/shared/components/constants.dart';

class ApiManger {

 static Future<SourceResponse> getSources(String category)async{
    Uri url=Uri.https(Constants.BASE_URL,"/v2/top-headlines/sources",{"apiKey":"17b67a6ef92843d0af4c8d9867b355a6","category":category});
http.Response response=await http.get(url);
Map<String,dynamic> json=jsonDecode(response.body);
return SourceResponse.fromJson(json);
  }

  static Future<NewsResponse> getNewsData(String sourceId) async {
    Uri url = Uri.https(Constants.BASE_URL, "/v2/everything",
        {"sources": sourceId, "apiKey": "17b67a6ef92843d0af4c8d9867b355a6"});
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }

 static Future<NewsResponse> getSearchNews(String query) async {
   Uri url = Uri.https(Constants.BASE_URL, "/v2/everything",
       {"q": query, "apiKey": "17b67a6ef92843d0af4c8d9867b355a6"});
   http.Response response = await http.get(url);
   var json = jsonDecode(response.body);
   return NewsResponse.fromJson(json);
 }
}
