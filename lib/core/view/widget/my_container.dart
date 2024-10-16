import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final double? topRight;
  final double? topLeft;
  final double? bottomRight;
  final double? bottomLeft;

  final Color? color;
  final Widget? child;

  final  EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Gradient? gradient;

  const MyContainer(
      {super.key, this.height,
      this.padding,
      this.margin,
      this.child,
      this.color,
      this.width,
      this.topRight,
      this.topLeft,
      this.bottomRight ,
        this.gradient,
      this.bottomLeft });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: child,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          color: color,
          gradient: gradient,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(topRight??10),
              topLeft: Radius.circular(topLeft??10),
              bottomLeft: Radius.circular(bottomLeft??0),
              bottomRight: Radius.circular(bottomRight??0))),
    );
  }
}
