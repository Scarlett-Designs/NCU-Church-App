import 'package:church/data/models/newsModel.dart';
import 'package:church/services/newsWebService.dart';
import 'package:flutter/material.dart';

import 'newsViewModel.dart';


enum LoadingStatus {
  completed,
  searching,
  empty,
}

class NewsArticleListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();


  void newsHeadlines() async {

    List<NewsArticle> newsArticles = await NewsWebService().fetchTopHeadlines();
    notifyListeners();

    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();

    if (this.articles.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();
  }
}
