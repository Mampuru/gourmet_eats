
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gourmet_eats/constants.dart';
import 'package:gourmet_eats/views/checkout_view.dart';

class CartView extends StatefulWidget {
  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  var total = 55.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Text("Cart List",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30),),
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
                        Row(
                          children: [
                            Text("1x Single Beef Burger   R55.00",style: TextStyle(fontSize: 25,color: Colors.white),)
                          ],
                        )
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
        TextButton(onPressed: () {
        }, child: Text("TOTAL: R$total",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20.0,color: Colors.black))),
        TextButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutView()),);
        }, child: Text("CHECKOUT",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25.0,color: Colors.black))),
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
