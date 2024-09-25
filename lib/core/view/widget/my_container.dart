import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget{
  double? height;
  double? width;
  double topRight;
  double topLeft;
  double bottomRight;
  double bottomLeft;


  Color? color;
  Widget? child;

  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;

  MyContainer({this.height,this.padding,this.margin,this.child,this.color,this.width,this.topRight=10,this.topLeft=10,this.bottomRight=0,this.bottomLeft=0});
  @override
  Widget build(BuildContext context) {
   return Container(
     height: height,
     width: width,
     child: child,
     margin: margin,
     padding: padding,
     decoration: BoxDecoration(color: color,borderRadius: BorderRadius.only(topRight: Radius.circular(topRight),topLeft: Radius.circular(topLeft),bottomLeft: Radius.circular(bottomLeft),bottomRight: Radius.circular(bottomRight))),
   );
  }

}