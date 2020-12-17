import 'package:church/screens/newsDetails.dart';
import 'package:church/viewModels/newsViewModel.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class NewsGrid extends StatelessWidget {
  final List<NewsArticleViewModel> articles;

  NewsGrid({this.articles});

  void _showNewsArticleDetails(BuildContext context, NewsArticleViewModel vm) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return NewsArticleDetailScreen(
        article: vm,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: this.articles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              (MediaQuery.of(context).orientation == Orientation.portrait)
                  ? 1
                  : 1),
      itemBuilder: (BuildContext _, int index) {
        final article = this.articles[index];

        return GestureDetector(
          onTap: () {
            _showNewsArticleDetails(context, article);
          },
          child:  GFCard(
            boxFit: BoxFit.cover,
            titlePosition: GFPosition.end,
            image: Image.network(article.imageUrl),
            title: GFListTile(
              title: Text(
                article.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textScaleFactor: 0.9,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitleText: "Christian News",
            ),
            content: Text(
              article.description,
              style: TextStyle(
              ),
              textScaleFactor: 0.9,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }
}
