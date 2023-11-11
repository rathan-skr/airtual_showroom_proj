import 'package:flutter/material.dart';
class RedButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final double width;

  const RedButton({
    Key? key,required this.label,required this.onPressed,required this.width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
        width: MediaQuery.of(context).size.width*width,
        decoration: BoxDecoration(color:Colors.red, borderRadius: BorderRadius.circular(25)),
        child: MaterialButton(
          onPressed:onPressed ,
          child:  Text(label),
        )
    );
  }
}