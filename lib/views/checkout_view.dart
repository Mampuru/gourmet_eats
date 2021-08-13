import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gourmet_eats/constants.dart';
import 'package:gourmet_eats/main.dart';
import 'package:gourmet_eats/views/landing_view.dart';
import 'package:gourmet_eats/widgets/share_button_widget.dart';
import 'package:share/share.dart';

class CheckoutView extends StatelessWidget {
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
      appBar: AppBar(
        leading: Icon(Icons.menu,size:30,color: Colors.white,),
        title: Text("Gourmet Eats"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildContent(context),
          ),
        ),
      ),
    );
  }

  Widget buildContent(context){
    return Card(
      color: PrimaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20.0,),
            Text("TOTAL: R100.00",style: TextStyle(fontSize: TitleText),),
            SizedBox(height: 10.0,),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                focusColor: Colors.green,
                fillColor: White,
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0,),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusColor: White,
                fillColor: White,
                labelText: 'Mobile Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0,),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                focusColor: White,
                fillColor: White,
                labelText: 'Comment',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0,),
            // Center(
            //   child: ConstrainedBox(
            //     constraints: BoxConstraints.tightFor(width: 150.0,),
            //     child: ElevatedButton(onPressed: () => {
            //       Fluttertoast.showToast(
            //         msg: "Thank you order has been placed",
            //         toastLength: Toast.LENGTH_SHORT,
            //         gravity: ToastGravity.CENTER,
            //         timeInSecForIosWeb: 1,
            //         backgroundColor: Colors.red,
            //         textColor: Colors.white,
            //         fontSize: 16.0
            //       ),
            //       Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()),)
            //     }, child: Text("PLACE ORDER"),
            //         style: ElevatedButton.styleFrom(primary: White)
            //     ),
            //   ),
            // ),
            ShareButtonWidget(onClicked: () {
              Share.share(object.toString());
            },)
          ],
        ),
      ),
    );


  }


}
