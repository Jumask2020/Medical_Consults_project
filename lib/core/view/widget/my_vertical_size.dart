
import 'package:flutter/material.dart';

class MyVerticalSize extends StatelessWidget{
  final double? height;
  const MyVerticalSize({super.key,this.height});
  @override
  Widget build(BuildContext context) {
   return SizedBox(height:height??10);
  }

}