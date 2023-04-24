import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nytimes/constants/api_key.dart';
import 'package:nytimes/screens/news_screen/models/articles.dart';

class NewsArticle {
  Future<Articles?> getNews(int  periodValues) async {
    var baseurl = 'http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/$periodValues.json?api-key=$API_KEY';
    var response = await http.get(Uri.parse(baseurl));
    if (response.statusCode == 200) {
      //var jsonResponse =
      // convert.jsonDecode(response.body) as Map<String, dynamic>;
      var responseData =  articlesFromJson(response.body);
      inspect(responseData);
      return responseData;
    } else {
      debugPrint('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }
}
