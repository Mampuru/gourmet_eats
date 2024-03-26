
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gourmet_eats/constants.dart';
import 'package:gourmet_eats/views/build_burger/drinks_view.dart';
import 'package:gourmet_eats/views/build_burger/wings_view.dart';
import 'package:gourmet_eats/views/menu_detail_view.dart';

class MenuView extends StatefulWidget {
  @override
  _MenuViewState createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(BackgroundImage),
            fit: BoxFit.cover,
            colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.3),BlendMode.darken)
          )
      ),
      child:  Column(
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
                        'MENU',
                        style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color:Colors.white, decoration: TextDecoration.underline,),),
                      SizedBox(height: 30.0,),
                      InkWell(
                        onTap: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MenuDetailView()),)
                        },
                        child: Text(
                          'Beef Burger',
                          style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:Colors.white,),),
                      ),
                      SizedBox(height: 24.0,),
                      InkWell(
                        onTap: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MenuDetailView()),)
                        },
                        child: Text(
                          'Chicken Burger',
                          style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:Colors.white,),),
                      ),
                      SizedBox(height: 24.0,),
                      InkWell(
                        onTap: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => WingsView()),)
                        },
                        child: Text(
                          'Wings',
                          style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:Colors.white,),),
                      ),
                      SizedBox(height: 24.0,),
                      InkWell(
                        onTap: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DrinksView()),)
                        },
                        child: Text(
                          'Drinks',
                          style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:Colors.white,),),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Image(image: AssetImage(HalalImage),width: 70,height: 70,),
          ),
        ],
      ),
    );
  }

 Widget buildBlur({
   required Widget child,
   BorderRadius? borderRadius,
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
