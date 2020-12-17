import 'package:flutter/material.dart';


class VideoCard extends StatelessWidget {

  final videoName;
  final imgPath;
  const VideoCard({Key key, @required this.videoName, this.imgPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Material(
          borderRadius: BorderRadius.circular(10.0),
          elevation: 3.0,
          child: Container(
              padding: EdgeInsets.only(left: 15.0, right: 10.0),
              width: MediaQuery.of(context).size.width - 10.0,
              height: 150.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Row(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 170.0,
                        width: 135.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(imgPath),
                                fit: BoxFit.contain)),
                      ),
                      SizedBox(width: 12.0),
                      Container(
                        width: MediaQuery.of(context).size.width - 200.0,
                        child: Text(
                          videoName,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  )
                ],
              ))),
    );
  }
}
