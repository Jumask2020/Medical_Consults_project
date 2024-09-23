import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/constant/app_color.dart';

class MyElvatedButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? horizontal;
  final double? vertical;
  const MyElvatedButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.backgroundColor,
      this.textColor,
      this.horizontal,
      this.vertical});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 40,
        margin: EdgeInsets.symmetric(
            horizontal: horizontal ?? 30, vertical: vertical ?? 10),
        decoration: BoxDecoration(
            color: backgroundColor ?? AppColor.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Center(
          child: Text(
            label,
            style:  TextStyle(
                color: textColor?? Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
