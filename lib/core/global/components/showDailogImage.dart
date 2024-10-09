
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'imagepicker.dart';


void ShowDailogImage(BuildContext context,File? pathImage){
  showDialog(
    context: context,
    builder: (BuildContext context) => Dialog(
      child: SizedBox(
        width: 100,
        height: 100,
        child: Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () async{
                  pathImage =  await imagePicker(ImageSource.camera);
                  print(pathImage);
                },
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  size: 50,
                )),
            IconButton(
                onPressed: () async{
                  pathImage  = await imagePicker(ImageSource.gallery);
                  print(pathImage);

                },
                icon: const Icon(
                  Icons.image,
                  size: 50,
                ))
          ],
        ),
      ),
    ),
  );
}