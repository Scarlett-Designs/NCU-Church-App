import 'package:church/ui/homePageBackground.dart';
import 'package:church/widgets/homePageCard.dart';
import 'package:church/widgets/sizeconfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final List<String> imageList = [
    "assets/images/carousel1.jpg",
    "assets/images/carousel2.jpg",
    "assets/images/carousel3.jpg",
    "assets/images/carousel4.jpg",
    "assets/images/carousel5.jpg",
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
                            child: Image.asset(url,
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
