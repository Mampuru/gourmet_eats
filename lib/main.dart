import 'package:flutter/material.dart';
import 'package:gourmet_eats/views/landing_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gourmet Eats',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu,size:30,color: Colors.white,),
          title: Text("Gourmet Eats"),
        ),
        body: Center(
          child: LandingView()
          ),
        ),
    );
  }
}


