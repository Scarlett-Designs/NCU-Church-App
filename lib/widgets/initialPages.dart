import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:church/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/getwidget.dart';
import 'package:church/res/globals.dart';

class InitialPages extends StatefulWidget {
  @override
  _InitialPagesState createState() => _InitialPagesState();
}

class _InitialPagesState extends State<InitialPages> {
  PageController _pageController;
  List<Widget> slideList;
  int initialPage;
  int initialIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    initialPage = _pageController.initialPage;
    initial = false;
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GFIntroScreen(
        color: Colors.blueGrey,
        slides: slides(),
        pageController: _pageController,
        currentIndex: initialIndex,
        pageCount: 5,
        introScreenBottomNavigationBar: GFIntroScreenBottomNavigationBar(
          pageController: _pageController,
          pageCount: slideList.length,
          currentIndex: initialPage,
          onForwardButtonTap: () {
            _pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear);
          },
          onBackButtonTap: () {
            _pageController.previousPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear);
          },
          onDoneTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyChurch()),
            );
          },
          onSkipTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyChurch()),
            );
          },
          navigationBarColor: Colors.white,
          showDivider: false,
          inactiveColor: Colors.grey[200],
          activeColor: GFColors.SUCCESS,
        ),
      ),
    );
  }

  List<Widget> slides() {
    slideList = [
      Container(
        color: Color.fromRGBO(176, 213, 237, 1),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GFImageOverlay(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 70.0, left: 20),
                  child: Column(
                    children: [
                      Text(
                        'Welcome',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.dancingScript(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            decoration: TextDecoration.none,
                        // style: TextStyle(
                        //     color: Colors.white,
                        //     decoration: TextDecoration.none,
                        //     fontSize: 25),
                      ),
                ),
                      Text(
                        'to the ',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none,
                          // style: TextStyle(
                          //     color: Colors.white,
                          //     decoration: TextDecoration.none,
                          //     fontSize: 25),
                        ),
                      ),
                      Text(
                        'NCU Church App',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.breeSerif(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none,
                          // style: TextStyle(
                          //     color: Colors.white,
                          //     decoration: TextDecoration.none,
                          //     fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            image: const AssetImage("assets/images/logo.png"),
            boxFit: BoxFit.none,
            colorFilter:
                ColorFilter.mode(Colors.black.withOpacity(0), BlendMode.darken),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      Container(
        color: Color.fromRGBO(128, 0, 128, 0.5),
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Container(
            child: Text(
                'View Church Events',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  // style: TextStyle(
                  //     color: Colors.white,
                  //     decoration: TextDecoration.none,
                  //     fontSize: 25),
                ),
    ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                image: DecorationImage(
                  image: AssetImage("assets/images/calendar.png"),
                  fit: BoxFit.fitWidth,
                )),
          ),
        ),
      ),
      Container(
        color: Color.fromRGBO(0, 0, 139, 0.5),
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              Text(
                'View Current Christian News',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    image: DecorationImage(
                      scale: 0.5,
                      image: AssetImage("assets/images/news.png"),
                      fit: BoxFit.fitHeight,
                    )),
              ),
            ],
          ),
        ),
      ),
      Container(
        color: Color.fromRGBO(176, 213, 237, 1),
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              Text(
                'View Church Videos and Livestreams',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    image: DecorationImage(
                      image: AssetImage("assets/images/videos.png"),
                      fit: BoxFit.fitWidth,
                    )),
              ),
            ],
          ),
        ),
      ),
      Container(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Container(
            child: Text(
              'Return Tithe & Offering',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                image: DecorationImage(
                  image: AssetImage("assets/images/tithe.png"),
                  fit: BoxFit.contain,
                )),
          ),
        ),
      ),
    ];
    return slideList;
  }
}
