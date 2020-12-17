import 'package:church/screens/home.dart';
import 'package:church/screens/news.dart';
import 'package:church/screens/titheandoffering.dart';
import 'package:church/screens/videos.dart';
import 'package:church/viewModels/eventsListViewModel.dart';
import 'package:church/viewModels/newsListViewModel.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarView.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/motiontabbar.dart';
import 'package:provider/provider.dart';
import 'package:church/res/globals.dart';
import 'package:church/widgets/initialPages.dart';

import 'screens/events.dart';

void main() {
  runApp(MyChurch());
}

class MyChurch extends StatefulWidget {
  @override
  _MyChurchState createState() => _MyChurchState();
}

class _MyChurchState extends State<MyChurch> with TickerProviderStateMixin {
  MotionTabController _tabController;
  bool index;

  @override
  void initState() {
    super.initState();
    _tabController =
        MotionTabController(initialIndex: 2, vsync: this, length: 5);
    index=initial;
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MyChurchApp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: index==true ?  InitialPages(): MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => NewsArticleListViewModel(),
              ),
              ChangeNotifierProvider(
                create: (_) => EventsListViewModel(),
              )
            ],
            child: Scaffold(
              extendBodyBehindAppBar: true,
              //appBar: buildAppBar(context, isTransparent: true),
              body: MotionTabBarView(
                controller: _tabController,
                children: <Widget>[
                  Events(),
                  News(),
                  HomePage(),
                  Videos(),
                  TitheAndOffering()
                ],
              ),
              bottomNavigationBar: MotionTabBar(
                labels: ["Events", "News", "Home", "Videos", "Tithe"],
                initialSelectedTab: "Home",
                tabIconColor: Color.fromARGB(255, 21, 120, 201),
                tabSelectedColor: Color.fromARGB(200,255,200,30),
                onTabItemSelected: (int value) {
                  setState(() {
                    _tabController.index = value;
                  });
                },
                icons: [
                  Icons.event,
                  Icons.chrome_reader_mode,
                  Icons.home,
                  Icons.ondemand_video,
                  Icons.payment
                ],
                textStyle: TextStyle(color: Colors.lightBlue),
              ),
            )));
  }
}
