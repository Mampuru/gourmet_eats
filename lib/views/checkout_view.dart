import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gourmet_eats/constants.dart';
import 'package:gourmet_eats/widgets/primary_button_widget.dart';
import 'package:share/share.dart';

class CheckoutView extends StatelessWidget {
  final total;
  CheckoutView({this.total});

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
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Text("Checkout",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30),),
      ),
      bottomNavigationBar: bottomBar(context),
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
                        Text("TOTAL: R$total",style: TextStyle(fontSize: TitleText,color: Colors.white),),
                        SizedBox(height: 10.0,),
                        TextField(
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        TextField(
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Mobile Number',
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        TextField(
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Comment',
                            labelStyle: TextStyle(color: Colors.white),
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

  Widget bottomBar(BuildContext context){
    return Container(
      color: Colors.grey[900],
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PrimaryButton(buttonName: "SEND ORDER",width:340,onTap: () {
              Share.share(object.toString());
            },),
          )
        ],
      ),
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
