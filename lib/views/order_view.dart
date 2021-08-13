import 'package:flutter/material.dart';
import 'package:gourmet_eats/constants.dart';
import 'package:gourmet_eats/views/checkout_view.dart';
import 'package:gourmet_eats/widgets/labeled_checkbox.dart';

class OrderView extends StatefulWidget {
  @override
  _OrderViewState createState() => _OrderViewState();
}

//ENUM for the Radio buttons
enum BurgerType { Beef,Chicken}

class _OrderViewState extends State<OrderView> {
  BurgerType _character = BurgerType.Beef ;
  bool _pickles = false;
  bool _onions = false;
  bool _lettuce = false;
  bool _cheese = false;
  bool _tomato = false;

  bool _addToppings = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: bottomBar(),
      ),
      appBar: AppBar(
        leading: Icon(Icons.menu,size:30,color: Colors.white,),
        title: Text("Gourmet Eats"),
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
        Padding(
          padding: const EdgeInsets.only(right:250.0),
          child: Text("Build Burger 1",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18.0),),
        ),
        Divider(color: Colors.black,endIndent: 5.0,indent: 5.0,),
        ListTile(
          title: const Text('Beef'),
          leading: Radio<BurgerType>(
            activeColor: Colors.black,
            value: BurgerType.Beef ,
            groupValue: _character,
            onChanged: (BurgerType value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Chicken'),
          leading: Radio<BurgerType>(
            activeColor: Colors.black,
            value: BurgerType.Chicken ,
            groupValue: _character,
            onChanged: (BurgerType value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        SizedBox(height: 10.0,),
        Padding(
          padding: const EdgeInsets.only(right:220.0),
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
          padding: const EdgeInsets.only(right:300.0),
          child: Text("Extras",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 19.0),),
        ),
        LabeledCheckbox(label: "Add Toppings",padding:const EdgeInsets.only(left:15.0),value: _addToppings,onChanged: (bool newValue) {
          setState(() {
            _addToppings = newValue;
          });
        },),

      ],
    );
  }

  Widget bottomBar(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("BURGERS:  2",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18.0)),
        TextButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutView()),);
        }, child: Text("PLACE ORDER",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20.0))),
        Text("TOTAL",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18.0))
      ],
    );
  }
}
