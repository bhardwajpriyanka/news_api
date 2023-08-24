import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_api/screen/home/model/home_model.dart';

class ApiHelper
{
  NewsModal? newsModal;

  Future<NewsModal?> newsApi()
  async {
    String? apiLink="https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c1f59c2149634ac1ac4f177c9ad8194b";
    Uri uri=Uri.parse(apiLink);
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    newsModal = NewsModal().newsJson(json);
    return newsModal;
  }
}