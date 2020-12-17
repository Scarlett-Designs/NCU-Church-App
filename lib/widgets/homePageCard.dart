import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var urlY ="https://www.youtube.com/channel/UCAkwrMUUkwZ7z5IrxxYptwg";
    var urlF ="https://www.facebook.com/NCUChurch/";
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 10),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
      ),
      child: GFCard(
        title: GFListTile(
          title: GFTypography(
            icon: ImageIcon(
                AssetImage('assets/logos/adventist-symbol-tm--winter.png'),
                size: 50.0),
            text: 'About Us',
            type: GFTypographyType.typo3,
            dividerWidth: 160,
          ),
        ),
        content: Container(
            child: Column(
              children: <Widget>[
                Text(
                    "Northern Caribbean University Church is located at Manchester Road in Mandeville, Jamaica.\n"),
                GFTypography(
                  text: '(876) 963-7327',
                  showDivider: false,
                  type: GFTypographyType.typo5,
                  icon: Icon(Icons.phone),
                ),
                GFTypography(
                  text: 'church@ncu.edu.jm',
                  showDivider: false,
                  type: GFTypographyType.typo5,
                  icon: Icon(Icons.email),
                ),
                SizedBox(height: 12),
              ],
            )),
        buttonBar: GFButtonBar(
          //alignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () async {
                if (await canLaunch(urlY)) {
                  await launch(urlY);
                } else {
                  throw 'Could not launch';
                }
              },
              child: GFAvatar(
                child: Image(
                  image: AssetImage("assets/logos/youtube.png"),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                if (await canLaunch(urlF)) {
                  await launch(urlF);
                } else {
                  throw 'Could not launch';
                }
              },
              child: GFAvatar(
                child: Image(
                  image: AssetImage("assets/logos/facebook.png"),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
