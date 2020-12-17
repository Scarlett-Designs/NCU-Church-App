import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


AppBar buildAppBar(BuildContext context,
    {bool isTransparent = false, String title}) {
  return AppBar(
    backgroundColor: isTransparent ? Colors.transparent: Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.menu,
        color: Colors.grey,
      ),
      onPressed: () {},
    ),
    title: Text("",
      style: TextStyle(color: Colors.blue),
    ),
    centerTitle: true,
    actions: [
      IconButton(
        icon: ClipOval(child: Image.network('https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-thumbnail/s3/072013/seventhdayadventistchurch.jpg?itok=34woqjwX', fit: BoxFit.fill,)),
        onPressed: () {},
      )
    ],
  );
}
