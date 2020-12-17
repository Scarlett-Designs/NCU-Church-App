import 'package:church/data/models/channelModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VideosPageBackground extends StatelessWidget {

  final screenHeight;
  final Channel channel;
//
  const VideosPageBackground({Key key, @required this.screenHeight, this.channel}) : super(key: key);
//
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
        color: Color.fromRGBO(176, 213, 237, 1),
        child: Column(children: [
          Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                width: double.infinity,
                height: screenHeight * 0.455,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 40.0,
                        backgroundImage: NetworkImage(channel.profilePictureUrl),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      channel.title,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Videos and Streams",
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
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
                    ColorFilter.mode(Colors.lightBlueAccent, BlendMode.multiply),
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/videosBG.jpg"),
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




