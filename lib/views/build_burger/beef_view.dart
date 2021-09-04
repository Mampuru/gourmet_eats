import 'package:flutter/material.dart';
import 'package:gourmet_eats/constants.dart';
import 'package:gourmet_eats/views/checkout_view.dart';
import 'package:gourmet_eats/views/menu_view.dart';
import 'package:gourmet_eats/widgets/labeled_checkbox.dart';

class BeefView extends StatefulWidget {
  @override
  _BeefViewState createState() => _BeefViewState();
}

enum BurgerType { Beef,Chicken}

class _BeefViewState extends State<BeefView> {
  BurgerType _character = BurgerType.Beef ;
  bool _pickles = false;
  bool _onions = false;
  bool _lettuce = false;
  bool _cheese = false;
  bool _tomato = false;

  bool _addDoublePattie = false;
  bool _addCheese = false;
  bool _addChilli = false;

  bool _sweetChilli = false;
  bool _tomatoSauces =  false;
  bool _bbq = false;
  bool _periPeri = false;

  var counter = 0;
  var total = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: bottomBar(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Text("Beef Burger",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30),),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 250.0,
                child: Center(child: Text("IMAGE",style: TextStyle(fontSize: 30.0),)),),
              orderList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget orderList(context){
    return Container(
      width: MediaQuery.of(context).size.width,
      color: PrimaryColor,
      child: Column(
        children: [
          SizedBox(height: 20.0,),
          buildBurger()
        ],
      ),
    );
  }

  Widget buildBurger(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Beef burgers",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
            IconButton(onPressed: () => {
            setState(() {
              counter = --counter;
            }),
              calculateTotal()
            }, icon: Icon(Icons.remove_circle,size: 30,)),
            Text("$counter",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,),),
            IconButton(onPressed: () => {
              setState(() {
                counter = ++counter;
              }),
              calculateTotal()
            }, icon: Icon(Icons.add_circle,size: 30,)),
          ],
        ),
        Divider(color: Colors.black,endIndent: 5.0,indent: 5.0,),
        
        SizedBox(height: 10.0,),
        Padding(
          padding: const EdgeInsets.only(right:270.0),
          child: Text("Extras",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 19.0),),
        ),
        LabeledCheckbox(label: "Double Patty",padding:const EdgeInsets.only(left:15.0),value: _addDoublePattie,onChanged: (bool newValue) {
          setState(() {
            _addDoublePattie = newValue;
          });
        },),
        LabeledCheckbox(label: "Cheese",padding:const EdgeInsets.only(left:15.0),value: _addCheese,onChanged: (bool newValue) {
          setState(() {
            _addCheese = newValue;
          });
        },),
        LabeledCheckbox(label: "Chilli",padding:const EdgeInsets.only(left:15.0),value: _addChilli,onChanged: (bool newValue) {
          setState(() {
            _addChilli = newValue;
          });
        },),
        Padding(
          padding: const EdgeInsets.only(right:190.0),
          child: Text("Remove Toppings",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 19.0),),
        ),
        LabeledCheckbox(label: "Pickles",padding:const EdgeInsets.only(left:15.0),value: _pickles,onChanged: (bool newValue) {
          setState(() {
            _pickles = newValue;
          });
        },),
        LabeledCheckbox(label: "Onions",padding:const EdgeInsets.only(left:15.0),value: _onions,onChanged: (bool newValue) {
          setState(() {
            _onions = newValue;
          });
        },),
        LabeledCheckbox(label: "Lettuce",padding:const EdgeInsets.only(left:15.0),value: _lettuce,onChanged: (bool newValue) {
          setState(() {
            _lettuce = newValue;
          });
        },),
        LabeledCheckbox(label: "Cheese",padding:const EdgeInsets.only(left:15.0),value: _cheese,onChanged: (bool newValue) {
          setState(() {
            _cheese = newValue;
          });
        },),
        LabeledCheckbox(label: "Tomato",padding:const EdgeInsets.only(left:15.0),value: _tomato,onChanged: (bool newValue) {
          setState(() {
            _tomato = newValue;
          });
        },),
        Padding(
          padding: const EdgeInsets.only(right:270.0),
          child: Text("Sauces",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 19.0),),
        ),
        LabeledCheckbox(label: "Sweet Chili",padding:const EdgeInsets.only(left:15.0),value: _sweetChilli,onChanged: (bool newValue) {
          setState(() {
            _sweetChilli = newValue;
          });
        },),
        LabeledCheckbox(label: "Tomato Sauces",padding:const EdgeInsets.only(left:15.0),value: _tomatoSauces,onChanged: (bool newValue) {
          setState(() {
            _tomatoSauces = newValue;
          });
        },),
        LabeledCheckbox(label: "BBQ",padding:const EdgeInsets.only(left:15.0),value: _bbq,onChanged: (bool newValue) {
          setState(() {
            _bbq = newValue;
          });
        },),
        LabeledCheckbox(label: "Peri-Peri",padding:const EdgeInsets.only(left:15.0),value: _periPeri,onChanged: (bool newValue) {
          setState(() {
            _periPeri = newValue;
          });
        },),

        SizedBox()
      ],
    );
  }

  Widget bottomBar(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MenuView()),);
        }, child: Text("TOTAL: R$total",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20.0,color: Colors.black))),
        TextButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutView()),);
        }, child: Text("ADD TO CART",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25.0,color: Colors.black))),
      ],
    );
  }

  calculateTotal(){
    var _total = 50*counter;
    setState(() {
      total = _total.toDouble();
    });
  }
}
