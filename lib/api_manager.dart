import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/Models/sources_response.dart';

import 'Models/news_response.dart';

class API_Manager {
  static String baseURL = "newsapi.org";

//https://newsapi.org/v2/top-headlines/sources?apiKey=9f8642e7503f43cb872ad0be9bc86b37
  static Future<SourcesResponse> getSources() async {
    try {
      Uri url = Uri.https(baseURL, "v2/top-headlines/sources",
          {"apiKey": "9f8642e7503f43cb872ad0be9bc86b37"});
      var response = await http.get(url);
      return SourcesResponse.fromJson(jsonDecode(response
          .body)); // String to Map , then from json map to our model-class
    } on Exception catch (e) {
      print('api');
      throw e;
    }
  }

//https://newsapi.org/v2/everything?q=abc-news&apiKey=9f8642e7503f43cb872ad0be9bc86b37
  static Future<NewsResponse> getNews(String sourceID) async {
    try {
      Uri url = Uri.https(baseURL, "v2/everything", {
        // "q" : sourceName, //"abc-news"
        "sources": sourceID, //"abc-news"
        "apiKey": "9f8642e7503f43cb872ad0be9bc86b37"
      });
      var response = await http.get(url);
      return NewsResponse.fromJson(jsonDecode(response
          .body)); // String to Map , then from json map to our model-class
    } on Exception catch (e) {
      print('api2');
      throw e;
    }
  }
}
