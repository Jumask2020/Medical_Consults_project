import 'package:flutter/cupertino.dart';

class MyCircularContanier extends StatelessWidget {
  // MyCircularContanier({super.key});
  double? height;
  double? width;
  double radius;

  Color? color;
  Widget? child;

  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;

  MyCircularContanier(
      {this.height=100,
      this.padding,
      this.margin,
      this.child,
      this.color,
      this.width=100,
      this.radius = 50});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color,
        borderRadius: BorderRadius.circular(radius),
         image: DecorationImage( image: AssetImage("assets/images/accountDoctor.png"),fit: BoxFit.cover)     ,
      ),
    );
  }
}
