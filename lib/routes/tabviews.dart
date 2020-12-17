import 'package:church/screens/events.dart';
import 'package:church/screens/home.dart';
import 'package:church/screens/titheandoffering.dart';
import 'package:church/screens/videos.dart';
import 'package:church/screens/news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarView.dart';


class AppRoutes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MotionTabBarView(
      children: [Events(), News(), HomePage(), Videos(), TitheAndOffering()],
    );
  }
}
