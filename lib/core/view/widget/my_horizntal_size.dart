
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHorizntalSize extends StatelessWidget{
  final double? width;
  final Widget? child;
  const MyHorizntalSize({super.key, this.width=10,this.child});
  @override
  Widget build(BuildContext context) {
    return SizedBox(width:width,child:child ,);
  }

}