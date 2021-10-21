
import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gourmet_eats/constants.dart';
import 'package:gourmet_eats/models/menu_data.dart';
import 'package:gourmet_eats/views/build_burger/beef_view.dart';
import 'package:gourmet_eats/views/cart_view.dart';

class MenuDetailView extends StatefulWidget {
  @override
  _MenuDetailViewState createState() => _MenuDetailViewState();
}

class _MenuDetailViewState extends State<MenuDetailView> {
  var burgerType = MenuData(


  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Text("Beef Burger",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30),),
        actions: [
          Badge(
            badgeColor: Colors.orange,
            position: BadgePosition.topEnd(top: 10, end: 10),
            showBadge: true,
            badgeContent: null,
            child: IconButton(
              icon: Icon(
                Icons.shopping_basket,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CartView()));
              },
            ),
          ),

        ],
    ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(BackgroundImage),
                fit: BoxFit.cover,
                colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.3),BlendMode.darken)
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
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
                    color: Colors.black.withOpacity(0.2),
                    child: Column(
                      children: [
                        Text(
                          'Beef Burger',
                          style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color:Colors.white, decoration: TextDecoration.underline,),),
                        SizedBox(height: 30.0,),
                        InkWell(
                          onTap: () => {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => BeefView(type: "Single Beef")),)
                          },
                          child: Text(
                            'Single Patty',
                            style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:Colors.white,),),
                        ),
                        SizedBox(height: 24.0,),
                        InkWell(
                          onTap: () => {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => BeefView(type: "Double Beef")),)
                          },
                          child: Text(
                            'Double Patty',
                            style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:Colors.white,),),
                        ),
                        SizedBox(height: 24.0,),
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
