
import 'package:flutter/material.dart';

void ShowLoading(BuildContext context){
  showDialog(context: context, builder: (context) =>
  const Center(child: CircularProgressIndicator(),),);
}
