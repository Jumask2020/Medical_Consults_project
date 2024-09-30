import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/constant/app_color.dart';
import 'package:medical_consult_project/core/view/widget/my_circular_contanier.dart';
import 'package:medical_consult_project/core/view/widget/my_container.dart';
import 'package:medical_consult_project/core/view/widget/my_horizntal_size.dart';
import 'package:medical_consult_project/core/view/widget/my_vertical_size.dart';

class DisplayProfileView extends StatelessWidget {
  const DisplayProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:  Row(
            children: [
              Icon(Icons.person_search_rounded,textDirection: TextDirection.ltr,),
              Text("     الملف التعريفي بالطبيب"),

            ],
          ),
        ),
        body: MyContainer(height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
          topLeft: 10,
        topRight: 10,
        bottomLeft: 10,
        bottomRight: 10,
        color: AppColor.backgroundColor,
        child: Column(
          children: [
            Row(
              children: [
                MyCircularContanier(),
                MyHorizntalSize(),
                Column(
                  children: [
                    Text("د.فلان الفلاني"),
                    Text("التخصص"),
                  ],),


              ],
            ),
            MyVerticalSize(),
            MyHorizntalSize(width: 900,child: Divider(color: Colors.grey,thickness: 1)),
            Row(
              children: [
                //filter_frames icons
                Icon(Icons.note_alt,textDirection: TextDirection.ltr,),
                Text(" نبذة عن الطبيب"),

              ],
            ),
            Text("--------------------------"
                "-----\n---------------------------"
                "-------\n-----------------------"),

            MyVerticalSize(),
            MyHorizntalSize(width: 900,child: Divider(color: Colors.grey,thickness: 1)),
            Row(
              children: [
                Icon(Icons.pin_drop_outlined,textDirection: TextDirection.ltr,),
                Text(" المدينة:"),
                Text(" ----------"),


              ],
            ),          ],
        ),
        ),
      ),
    );
  }
}
