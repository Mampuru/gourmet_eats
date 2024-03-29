import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:gourmet_eats/views/cart_view.dart';
import 'package:gourmet_eats/views/menu_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Gourmet Eats',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          centerTitle: true,
          title: Text("Welcome To",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30),),
          actions: [
            IconButton(onPressed: () => {
            Navigator.push(context,MaterialPageRoute(builder: (context) => CartView()))
            }, icon: Icon(Icons.shopping_basket,color: Colors.white,))
          ],
        ),
        body: MenuView()
        ),
    );
  }
}