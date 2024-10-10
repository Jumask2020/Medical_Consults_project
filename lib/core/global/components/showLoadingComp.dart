
import 'package:flutter/material.dart';

void ShowLoadingFunction(BuildContext context){
  showDialog(context: context, builder: (context) =>
  const Center(child: CircularProgressIndicator(),),);
}
