import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/constant/app_color.dart';

class MyElvatedButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  // final double? horizontal;
  // final double? vertical;
  const MyElvatedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    // this.horizontal,/
    // this.vertical
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
      height: 40,
      minWidth: MediaQuery.of(context).size.width - 60,
      color:backgroundColor?? AppColor.primaryColor,
      shape:ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30),),
    );
    // return InkWell(
    //   borderRadius: const BorderRadius.all(Radius.circular(20)),
    //   onTap: onPressed,
    //   child: Container(
    //     width: MediaQuery.of(context).size.width - 60,
    //     height: 40,
    //     decoration: BoxDecoration(
    //         color: backgroundColor ?? AppColor.primaryColor,
    //         borderRadius: const BorderRadius.all(Radius.circular(20))),
    //     child: Center(
    //       child: Text(
    //         label,
    //         style: TextStyle(
    //             color: textColor ?? Colors.white,
    //             fontSize: 20,
    //             fontWeight: FontWeight.bold),
    //       ),
    //     ),
    //   ),
    // );
  }
}
