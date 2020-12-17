import 'package:church/ui/tithePageBackground.dart';
import 'package:church/widgets/sizeconfig.dart';
import 'package:church/widgets/titheInputField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class TitheAndOffering extends StatefulWidget {
  TitheAndOffering({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TitheAndOfferingState createState() => _TitheAndOfferingState();
}

class _TitheAndOfferingState extends State<TitheAndOffering> {

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        TithePageBackground(
            screenHeight: MediaQuery.of(context).size.height),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.black26,
                margin: EdgeInsets.fromLTRB(20, screenHeight*0.20, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight*.045),
                    Center(
                      child: Text(
                        "Tithe & Offering",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(45),
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 0.5),
                      ),
                    ),
                    SizedBox(height: 5),
                    Center(
                      child: Text(
                        '"Bring ye all the tithe into the storehouse."',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: getProportionateScreenWidth(17),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(child: TitheInputField()),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Column(
                          children: [
                            Text(
                              "Please Note",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: getProportionateScreenWidth(20),
                              ),
                            ),
                            Text(
                              "Amount must be to the nearest dollar(\$).\nCents are not accepted.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: getProportionateScreenWidth(17),
                              ),
                            ),
                          ],
                        ),
                    ),
                    SizedBox(height: 50,)
                  ],
                ),
              ),
            ]),
      ],
    );
  }
}
