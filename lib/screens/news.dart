import 'package:church/ui/newsPageBackground.dart';
import 'package:church/viewModels/newsListViewModel.dart';
import 'package:church/widgets/newsCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .newsHeadlines();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  Widget _buildList(NewsArticleListViewModel vs) {
    switch (vs.loadingStatus) {
      case LoadingStatus.searching:
        return Center(
          child: CircularProgressIndicator(),
        );
      case LoadingStatus.completed:
        return NewsGrid(
          articles: vs.articles,
        );
      case LoadingStatus.empty:
      default:
        return Center(
          child: Text("No results found"),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    var vs = Provider.of<NewsArticleListViewModel>(context);
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
        child: Stack(
          children: [
            NewsPageBackground(screenHeight: screenHeight),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: screenHeight*0.045),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    'Christian News',
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                ),
                Divider(
                  color: Colors.white70,
                  thickness: 6,
                  indent: 30,
                  endIndent: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 15, bottom: 15),
                  child: Text(
                    'Headlines',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: _buildList(vs),
                ),
              ],
            ),
          ],
        ),
    );
  }
}
