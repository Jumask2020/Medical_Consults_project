import 'package:flutter/material.dart';

import '../../constant/app_color.dart';

class MyTextFormField extends StatelessWidget {
  final String? labelText, hintText;
  final double? horizontal;
  final double? vertical;
  final double? height;
  final Widget? icon;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? iconColor;
  final Color? boarderColor;
  final Color? hintColor;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  //void Function()? onTap ;
  const MyTextFormField(
      {super.key,
      this.labelText,
      this.boarderColor,
      this.hintColor,
      this.hintText,
      this.icon,
      this.iconColor,
      this.obscureText,
      this.keyboardType,
      this.validator,
      this.horizontal,
      this.vertical,
      this.controller,
      this.prefixIcon,
      this.suffixIcon,
      this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ??45,
      margin: EdgeInsets.symmetric(
          horizontal: horizontal ?? 25, vertical: vertical ?? 5),
      child: TextFormField(
       //onTap: onTap,

        controller: controller,
        validator: validator,
        obscureText: obscureText ?? false,
        keyboardType: keyboardType,
        decoration: InputDecoration(
         // contentPadding: EdgeInsets.symmetric(vertical: ),
          // contentPadding: const EdgeInsets.symmetric(vertical: 1),
          labelText: labelText,
          hintText: hintText,
          hintStyle: TextStyle(color: hintColor ?? Colors.black),
          icon: icon,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          iconColor: iconColor,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:
                  BorderSide(color: boarderColor ?? AppColor.primaryColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:
                  BorderSide(color: boarderColor ?? AppColor.primaryColor)),
        ),
      ),
    );
  }
}
