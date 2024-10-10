import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/constant/app_color.dart';
import 'package:medical_consult_project/core/model/consult.dart';
import 'package:medical_consult_project/core/view/widget/my_circular_contanier.dart';
import 'package:medical_consult_project/core/view/widget/my_elevated_button.dart';
import 'package:medical_consult_project/core/view/widget/my_horizntal_size.dart';
import 'package:medical_consult_project/core/view_model/consult_v_m.dart';
import 'package:provider/provider.dart';

import '../../widget/my_container.dart';
import '../../widget/my_vertical_size.dart';

class ConsultDetails extends StatelessWidget {
   ConsultDetails({super.key});


  final ConsultVM _consultVM = ConsultVM();

  @override
  Widget build(BuildContext context) {
    Consult? consult = ModalRoute.settingsOf(context)!.arguments as Consult;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
        title:  const Row(
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
              child: FutureBuilder(
                future: _consultVM.fetchAllConsult(),
                builder:(context, snapshot) =>  Column(
                    children: [
                    Row(
                    children: [
                    MyCircularContanier(assetName: "assets/images/logo.jpg",),
                MyHorizntalSize(),
                Column(
                  children: [
                    Text(consult.patient!.name!),
                    Text(consult.patient!.gender!),
                    Text(consult.patient!.age!.toString()),
                  ],),


                ],
                            ),
                            MyVerticalSize(height: 30,),
                      Row(
                        children: [
                          Icon(Icons.text_snippet_outlined),
                          Text(consult.title!),

                        ],
                      ),
                         const MyHorizntalSize(width: 900,child: Divider(color: Colors.grey,thickness: 1)),
                           MyContainer(child: Text(consult.description!),
                           color: AppColor.secondaryColor,
                           width: MediaQuery.of(context).size.width,
                           padding: EdgeInsets.all(10),),
                     const MyVerticalSize(height: 30,),

                     const Row(
                        children: [
                          Icon(Icons.insert_page_break),
                          Text(" المرفقات الطبية"),

                        ],
                      ),
                      MyHorizntalSize(width: 900,child: Divider(color: Colors.grey,thickness: 1)),
                      MyContainer(child: Text(consult.attachedFile!),
                        color: AppColor.secondaryColor,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),),
                      MyVerticalSize(height: 30,),

                      MyElvatedButton(label: "رد", onPressed: (){
                        Navigator.pushNamed(context, "/chatting",arguments: consult.id.toString());
                      })

                            ],

                          ),
              )
        ),
          )
        ));
  }
}
