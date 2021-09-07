import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gourmet_eats/constants.dart';
import 'package:gourmet_eats/widgets/share_button_widget.dart';
import 'package:share/share.dart';

class CheckoutView extends StatelessWidget {
  final text = '';
  final object = {
    "name": "Jack",
    "number": "093094039",
    "comment": "Collecting at 10pm",
    "total": "100.0",
    "Burger": [
      {
        "type": "beef",
        "extra": [

        ],
        "toppings": [
          "cheese","tomato","lettuce",""
        ],

      }
  ]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Text("Checkout",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30),),
      ),
      bottomNavigationBar: bottomBar(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(BackgroundImage),
                fit: BoxFit.cover,
                colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.3),BlendMode.darken)
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: buildBlur(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(24),
                    width:  MediaQuery.of(context).size.width,
                    color: Colors.black.withOpacity(0.6),
                    child: Column(
                      children: [
                        SizedBox(height: 20.0,),
                        Text("TOTAL: R55.00",style: TextStyle(fontSize: TitleText,color: Colors.white),),
                        SizedBox(height: 10.0,),
                        TextField(
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            focusColor: Colors.green,
                            fillColor: White,
                            labelText: 'Name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            focusColor: White,
                            fillColor: White,
                            labelText: 'Mobile Number',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            focusColor: Colors.white,
                            fillColor: Colors.white,
                            labelText: 'Comment',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20.0,),

                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget bottomBar(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ShareButtonWidget(onClicked: () {
            Share.share(object.toString());
          },),
        )
      ],
    );
  }

  Widget buildBlur({
    @required Widget child,
    BorderRadius borderRadius,
    double sigmaX = 0,
    double sigmaY = 0,
  }) => ClipRRect(
    borderRadius: borderRadius ?? BorderRadius.zero,
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: sigmaX,sigmaY: sigmaY),
      child: child,
    ),
  );
}
