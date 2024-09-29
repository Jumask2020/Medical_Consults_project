import 'package:flutter/cupertino.dart';

class MyCircularContanier extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;


 final String? assetName ;

  final Color? color;
  final Widget? child;

  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const MyCircularContanier(
      {super.key,
      this.height,
      this.padding,
      this.margin,
      this.child,
      this.color,
      this.width,
      this.radius,
        this.assetName});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 100,
      height: height ?? 100,
      decoration: BoxDecoration(
          color: color,
        borderRadius: BorderRadius.circular(radius??5),
         image: DecorationImage( image: AssetImage(assetName??"assets/images/accountDoctor.png")
             ,fit: BoxFit.cover)     ,
      ),
    );
  }
}
