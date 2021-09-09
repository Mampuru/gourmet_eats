import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onTap;
  final EdgeInsets margin;
  final Color buttonColor;
  final Color textColor;
  final double height;
  final double width;

  PrimaryButton({
    @required this.buttonName,
    @required this.onTap,
    this.margin: const EdgeInsets.all(0.0),
    this.buttonColor: Colors.white,
    this.textColor: Colors.black,
    this.width:250.0,
    this.height:40.0,
  });

  @override
  Widget build(BuildContext context) {
    final customButton = Container(
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: width,height: height),
        child: ElevatedButton(
            onPressed: onTap,
            child: Text(buttonName,style: TextStyle(color: textColor,fontSize: 20.0),),
            style: ElevatedButton.styleFrom(primary: buttonColor,shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),)
        ),
      ),
    );
    return customButton;
  }
}
