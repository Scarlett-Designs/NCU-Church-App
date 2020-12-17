import 'package:church/ui/homePageBackground.dart';
import 'package:church/widgets/homePageCard.dart';
import 'package:church/widgets/sizeconfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final List<String> imageList = [
    "https://i.ytimg.com/vi/fBX9A7nTjY4/maxresdefault.jpg",
    "https://farm8.staticflickr.com/7407/15753353124_a04f22427a.jpg",
    "https://lh3.googleusercontent.com/proxy/BbNjA-0SbXvAg6UoCdKIA7oo-3aEC1i-74wucfrR4p4xLUGsDESO2eoD3gMGA_w7oJP1fSIt_Nnsqt6pJRt7kbqnbReRuXia6_KR-RSt36oo1W-r5418iaMVfH4lMzwSU9H3daLk0tIE-V9Uy_hlfOmWmoyl_RZ6uKid8ojXGxq8a5NL",
    "https://i.ytimg.com/vi/queQ3lW6frU/maxresdefault.jpg",
    "https://farm8.staticflickr.com/7457/13602551425_95c17ca812.jpg",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        HomePageBackground(screenHeight: screenHeight),
        Container(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 25),
                  GFCarousel(
                    height: screenHeight*0.5,
                    pagination: true,
                    passiveIndicator: Colors.grey,
                    activeIndicator: Colors.white,
                    autoPlay: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    items: imageList.map(
                      (url) {
                        return Container(
                          margin: EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            child: Image.network(url,
                                fit: BoxFit.fitHeight, width: screenWidth*.9),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                  HomePageCard(),
                  SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
