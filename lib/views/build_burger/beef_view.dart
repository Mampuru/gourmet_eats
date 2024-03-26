import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gourmet_eats/constants.dart';
import 'package:gourmet_eats/controllers/cart_controller.dart';
import 'package:gourmet_eats/models/cart_item.dart';
import 'package:gourmet_eats/views/cart_view.dart';
import 'package:gourmet_eats/widgets/labeled_checkbox.dart';
import 'package:gourmet_eats/widgets/primary_button_widget.dart';

class BeefView extends StatefulWidget {
  final type;
  BeefView({this.type});

  @override
  _BeefViewState createState() => _BeefViewState();
}

enum BurgerType { Beef,Chicken}

class _BeefViewState extends State<BeefView> {
  late String type;
  var toppings = [];
  var sauces = [];
  var extras = [];

  bool _pickles = false;
  bool _onions = false;
  bool _lettuce = false;
  bool _cheese = false;
  bool _tomato = false;

  bool _addCheese = false;
  bool _addChilli = false;

  bool _sweetChilli = false;
  bool _tomatoSauces =  false;
  bool _bbq = false;
  bool _periPeri = false;

  var counter = 0;
  var total = 0.0;

  final CartController controller = Get.put(CartController());

  @override
  void initState() {
    super.initState();
    type = widget.type;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: bottomBar(context),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Text("Beef Burger",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30),),
        actions: [
          Badge(
            backgroundColor:Colors.orange,
            isLabelVisible: true,
            label: Text('$counter'),
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
            Text("Single Beef burgers",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
            IconButton(onPressed: () => {
              if(counter == 0){
                //Do nothing
              }else{
                setState(() {
                  counter = --counter;
                }),
              },
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
        LabeledCheckbox(label: "Cheese",padding:const EdgeInsets.only(left:15.0),value: _addCheese,onChanged: (bool newValue) {
          setState(() {
            _addCheese = newValue;
            var _total = 5*counter;
            if(_addCheese){
              total = total + _total.toDouble();
              extras.add("Cheese");
            }else{
              total = total - _total.toDouble();
              extras.remove("Cheese");
            }
          });
        },),
        LabeledCheckbox(label: "Chilli",padding:const EdgeInsets.only(left:15.0),value: _addChilli,onChanged: (bool newValue) {
          setState(() {
            _addChilli = newValue;
            if(_addChilli){
              extras.add("Chilli");
            }else{
              extras.remove("Chilli");
            }
          });

        },),
        Padding(
          padding: const EdgeInsets.only(right:190.0),
          child: Text("Remove Toppings",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 19.0),),
        ),
        LabeledCheckbox(label: "Pickles",padding:const EdgeInsets.only(left:15.0),value: _pickles,onChanged: (bool newValue) {
          setState(() {
            _pickles = newValue;
            if(_pickles){
              toppings.add("Pickles");
            }else{
              toppings.remove("Pickles");
            }
          });
        },),
        LabeledCheckbox(label: "Onions",padding:const EdgeInsets.only(left:15.0),value: _onions,onChanged: (bool newValue) {
          setState(() {
            _onions = newValue;
            if(_onions){
              toppings.add("Onions");
            }else{
              toppings.remove("Onions");
            }
          });
        },),
        LabeledCheckbox(label: "Lettuce",padding:const EdgeInsets.only(left:15.0),value: _lettuce,onChanged: (bool newValue) {
          setState(() {
            _lettuce = newValue;
            if(_lettuce){
              toppings.add("Lettuce");
            }else{
              toppings.remove("Lettuce");
            }
          });
        },),
        LabeledCheckbox(label: "Cheese",padding:const EdgeInsets.only(left:15.0),value: _cheese,onChanged: (bool newValue) {
          setState(() {
            _cheese = newValue;
            if(_cheese){
              toppings.add("Cheese");
            }else{
              toppings.remove("Cheese");
            }
          });
        },),
        LabeledCheckbox(label: "Tomato",padding:const EdgeInsets.only(left:15.0),value: _tomato,onChanged: (bool newValue) {
          setState(() {
            _tomato = newValue;
            if(_tomato){
              toppings.add("Tomato");
            }else{
              toppings.remove("Tomato");
            }
          });
        },),
        Padding(
          padding: const EdgeInsets.only(right:270.0),
          child: Text("Sauces",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 19.0),),
        ),
        LabeledCheckbox(label: "Sweet Chili",padding:const EdgeInsets.only(left:15.0),value: _sweetChilli,onChanged: (bool newValue) {
          setState(() {
            _sweetChilli = newValue;
            if(_sweetChilli){
              sauces.add("Sweet Chili");
            }else{
              sauces.remove("Sweet Chili");
            }
          });
        },),
        LabeledCheckbox(label: "Tomato Sauces",padding:const EdgeInsets.only(left:15.0),value: _tomatoSauces,onChanged: (bool newValue) {
          setState(() {
            _tomatoSauces = newValue;
            if(_tomatoSauces){
              sauces.add("Tomato Sauces");
            }else{
              sauces.remove("Tomato Sauces");
            }
          });
        },),
        LabeledCheckbox(label: "BBQ",padding:const EdgeInsets.only(left:15.0),value: _bbq,onChanged: (bool newValue) {
          setState(() {
            _bbq = newValue;
            if(_bbq){
              sauces.add("BBQ");
            }else{
              sauces.remove("BBQ");
            }
          });
        },),
        LabeledCheckbox(label: "Peri-Peri",padding:const EdgeInsets.only(left:15.0),value: _periPeri,onChanged: (bool newValue) {
          setState(() {
            _periPeri = newValue;
            if(_periPeri){
              sauces.add("Peri-Peri");
            }else{
              sauces.remove("Peri-Peri");
            }
          });
        },),
      ],
    );
  }

  Widget bottomBar(BuildContext context){
    var _width = MediaQuery.of(context).size.width;
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
              Text("TOTAL: ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 13.0,color: Colors.white)),
              Text("R$total",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20.0,color: Colors.white))
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: PrimaryButton(buttonName: "ADD TO CART",width: _width,onTap: () => {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => CartView()),)
              addToCart()
            },),
          )
        ],
      ),
    );
  }

  calculateTotal(){
    var _total = 55*counter;
    setState(() {
      total = _total.toDouble();
    });
  }

  calculateDoubleTotal(){
    var _total = 75*counter;
    setState(() {
      total = _total.toDouble();
    });
  }

  addCheese(){
    var _total =  5*counter;
    setState(() {
      total = total + _total.toDouble();
    });
  }

  addToCart(){
    CartItem item = new CartItem();
    item.price = total;
    item.type = type;
    item.quantity = counter;
    item.removeToppings = toppings;
    item.sauces = sauces;
    item.extras = extras;

    controller.addToCart(item);
  }

}
