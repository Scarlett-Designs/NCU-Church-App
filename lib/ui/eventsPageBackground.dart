import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EventsPageBackground extends StatelessWidget {
  final screenHeight;

  const EventsPageBackground({Key key, @required this.screenHeight})
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
                    colorFilter: ColorFilter.mode(
                        Color.fromARGB(150, 244, 196, 48),
                        BlendMode.multiply),
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/eventsBG.jpg"),
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
