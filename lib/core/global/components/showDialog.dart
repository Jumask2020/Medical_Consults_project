import 'package:flutter/material.dart';

void showAlertDialog(BuildContext context,String text,String? title) {
  showDialog(
    context: context,

    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title??''),
        content: Text(text,),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();

            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}