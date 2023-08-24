import 'package:flutter/material.dart';
import 'package:news_api/screen/home/model/home_model.dart';
import 'package:news_api/screen/utils/api_helper.dart';


class HomeProvider extends ChangeNotifier
{
  NewsModal? NewsList;

  Future<void> callApi()
  async {
    ApiHelper ah = ApiHelper();
    NewsList = await ah.newsApi();
    notifyListeners();
  }
}