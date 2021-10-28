
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:gourmet_eats/controllers/cart_controller.dart';
import 'package:gourmet_eats/views/checkout_view.dart';
import 'package:gourmet_eats/widgets/primary_button_widget.dart';

class CartView extends StatefulWidget {
  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  CartController cartController = Get.find();
  var total=0.0;

  @override
  void initState() {
    super.initState();
    totalPrice(cartController.cart);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.grey[900],
          centerTitle: true,
          title: Text("Cart List", style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),),
        ),
        bottomNavigationBar: bottomBar(context),
        body: Obx(() => ListView.builder(
          itemCount: cartController.cart.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildBlur(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(24),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  color: Colors.black.withOpacity(0.6),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("${cartController.cart[index].quantity}x", style: TextStyle(
                              fontSize: 25, color: Colors.white),),
                          Text(cartController.cart[index].type, style: TextStyle(
                              fontSize: 25, color: Colors.white),),
                          Text("R${cartController.cart[index].price}", style: TextStyle(
                              fontSize: 25, color: Colors.white),),
                          IconButton(onPressed: () => {
                            cartController.removeFromCart(index),
                            totalPrice(cartController.cart),
                          }, icon: Icon(Icons.delete,color: Colors.orangeAccent,))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ))

    );
  }

  Widget bottomBar(BuildContext context) {
    var _width = MediaQuery
        .of(context)
        .size
        .width;
    return Container(
      height: 90,
      color: Colors.grey[900],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: 5,),
          Row(
            children: [
              SizedBox(width: 10,),
              Text("TOTAL: ", style: TextStyle(fontWeight: FontWeight.w600,
                  fontSize: 13.0,
                  color: Colors.white)),
              Text("R$total", style: TextStyle(fontWeight: FontWeight.w900,
                  fontSize: 20.0,
                  color: Colors.white))
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: PrimaryButton(
              buttonName: "CHECKOUT", width: _width, onTap: () =>
            {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => CheckoutView()),)
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
  }) =>
      ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
          child: child,
        ),
      );

  totalPrice(List list) {
    var priceList = [];
    if(list.isNotEmpty){
      list.forEach((element) {
        priceList.add(element.price);
      });
      setState(() {
        total = priceList.reduce((value, element) => value + element);
      });
    }else if(list.isEmpty){
      setState(() {
        total = 0.0;
      });
    }
  }

}