import 'package:church/res/globals.dart';
import 'package:church/routes/redirectCheckout.dart';
import 'package:church/widgets/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TitheInputField extends StatefulWidget {
  @override
  _TitheInputFieldState createState() => _TitheInputFieldState();
}

class _TitheInputFieldState extends State<TitheInputField> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(3, 3),
            blurRadius: 10,
            color: Colors.black.withOpacity(0.16),
            spreadRadius: -2,
          )
        ],
      ),
      child: TextFormField(
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(
              RegExp("[0-9]")),
        ],
        keyboardType: TextInputType.number,
        controller: myController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white70,
          hintText: "Enter tithe amount.",
          hintStyle: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.black26,
          ),
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(20.0),
            ),
          ),
          focusedBorder: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(20.0),
            ),
            borderSide: BorderSide(
              width: 3,
              color: Color.fromRGBO(225, 173, 1,1),
            ),
          ),
          prefixIcon: Icon(
            Icons.attach_money,
            color: Color.fromRGBO(225, 173, 1,1),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              userInput = int.parse(myController.text);
              if (userInput == 0) {
                final snackBar = SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                      'Amount must be greater than 0.'),
                );

                Scaffold.of(context)
                    .showSnackBar(snackBar);
              } else {
                userInput =
                    int.parse(myController.text);
                redirectToCheckout(context);
              }
            },
            icon: Icon(
              Icons.send,
              size: 25,
              color: Color.fromRGBO(225, 173, 1,1),
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenWidth(15),
          ),
        ),
      ),
    );
  }
}
