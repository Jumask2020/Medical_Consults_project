import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/constant/app_color.dart';
import 'package:medical_consult_project/core/view/widget/my_circular_contanier.dart';
import 'package:medical_consult_project/core/view/widget/my_elevated_button.dart';
import 'package:medical_consult_project/core/view/widget/my_horizntal_size.dart';

import '../../widget/my_container.dart';
import '../../widget/my_vertical_size.dart';

class ConsultDetails extends StatelessWidget {
  const ConsultDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
        title:  Row(
        children: [
        Icon(Icons.text_snippet),
        Text("  تفاصيل الاستشارة"),

    ],
          ),
          ),
          body: SingleChildScrollView(
            child:  MyContainer(height: MediaQuery.of(context).size.height,
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
                  MyCircularContanier(assetName: "assets/images/logo.jpg",),
              MyHorizntalSize(),
              Column(
                children: [
                  Text("المريض"),
                  Text("الجنس"),
                  Text("العمر"),
                ],),


              ],
            ),
            MyVerticalSize(height: 30,),
                    Row(
                      children: [
                        Icon(Icons.text_snippet_outlined),
                        Text(" الاستشارة"),

                      ],
                    ),
                        MyHorizntalSize(width: 900,child: Divider(color: Colors.grey,thickness: 1)),
           MyContainer(child: Text("يشعر بالم في الرأس و تحت العينين \nوالام في المعدة وغير مصاب بالسكري\n ويشعر برجفة"),
           color: AppColor.secondaryColor,
           width: MediaQuery.of(context).size.width,
           padding: EdgeInsets.all(10),),
                    MyVerticalSize(height: 30,),

                    Row(
                      children: [
                        Icon(Icons.insert_page_break),
                        Text(" المرفقات الطبية"),

                      ],
                    ),
                    MyHorizntalSize(width: 900,child: Divider(color: Colors.grey,thickness: 1)),
                    MyContainer(child: Text("data.1\ndata.2\ndata.3"),
                      color: AppColor.secondaryColor,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10),),
                    MyVerticalSize(height: 30,),

                    MyElvatedButton(label: "رد", onPressed: (){
                      Navigator.pushNamed(context, "/chatting");
                    })

            ],

          )
        ),
          )
        ));
  }
}
