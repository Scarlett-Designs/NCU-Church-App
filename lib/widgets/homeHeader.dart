import 'package:church/widgets/sizeconfig.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: getProportionateScreenWidth(25)),
      child: Stack(
        overflow: Overflow.visible,
        alignment: Alignment.center,
        children: [
          Image.network(
            "https://i.ytimg.com/vi/fBX9A7nTjY4/hqdefault.jpg",
            color: Color.fromRGBO(190, 190, 190, 1),
            colorBlendMode: BlendMode.modulate,
            fit: BoxFit.cover,
            width: double.infinity,
            height: getProportionateScreenHeight(315),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getProportionateScreenHeight(80)),
              Text(
                "NCU Church App",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(52),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 0.5),
              ),
              Text(
                "For all your church needs.",
                style: TextStyle(color: Colors.yellowAccent,fontSize: getProportionateScreenWidth(18),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}