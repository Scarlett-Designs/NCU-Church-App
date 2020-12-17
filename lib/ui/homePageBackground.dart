import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePageBackground extends StatelessWidget {
  final screenHeight;

  const HomePageBackground({Key key, @required this.screenHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    return SingleChildScrollView(
      child: Container(
        color: Color.fromARGB(130, 244, 196, 48),
        height: screenHeight,
        child: Column(children: [
          Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                width: double.infinity,
                height: screenHeight*.7,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(176, 213, 237, 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0, 10),
                      blurRadius: 20,
                      spreadRadius: 0,
                    ),
                  ],
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
