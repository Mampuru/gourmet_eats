import 'package:flutter/material.dart';
import 'package:gourmet_eats/constants.dart';
import 'package:gourmet_eats/views/order_view.dart';

class LandingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 20.0,),
          Text(WelcomeText,style: TextStyle(fontSize: TitleText),),
          SizedBox(height: 20.0,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildCard(context),
          )
        ],
      ),
    );
  }

  Widget buildCard(BuildContext context){
    return Card(
      color: PrimaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(LandingViewText,style: TextStyle(fontSize: TitleText),),
            SizedBox(height: 10.0,),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: White,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0,),
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 100.0,),
                child: ElevatedButton(onPressed: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) => OrderView()),)
                }, child: Text("Submit"),
                    style: ElevatedButton.styleFrom(primary: White)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
