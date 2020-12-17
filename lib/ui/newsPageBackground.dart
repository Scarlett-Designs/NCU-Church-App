import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewsPageBackground extends StatelessWidget {

  final screenHeight;

  const NewsPageBackground({Key key, @required this.screenHeight}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    return SingleChildScrollView(
      child: Container(
        color: Color.fromRGBO(176, 213, 237, 1),
        height: screenHeight,
        child: Column(children: [
          Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                width: double.infinity,
                height: screenHeight*.45,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0, 10),
                      blurRadius: 20,
                      spreadRadius: 0,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(200),
                    bottomRight: Radius.circular(200),
                  ),
                  image: DecorationImage(
                    colorFilter:
                    ColorFilter.mode(Color.fromRGBO(0, 71, 139, .5), BlendMode.multiply),
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/newsBG.jpg"),
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}




