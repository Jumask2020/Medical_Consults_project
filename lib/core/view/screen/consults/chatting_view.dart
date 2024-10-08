import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/constant/app_color.dart';
import 'package:medical_consult_project/core/view/widget/my_container.dart';
import 'package:medical_consult_project/core/view/widget/my_horizntal_size.dart';
import 'package:medical_consult_project/core/view/widget/my_messageBubbles.dart';
import 'package:medical_consult_project/core/view/widget/my_text_form_field.dart';
import 'package:medical_consult_project/core/view_model/consult_v_m.dart';

class Chatting extends StatelessWidget {
  ConsultVM consultVM = ConsultVM();
  Chatting({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // FutureBuilder(
              //     future: consultVM.fetchAllConsult(),
              //     builder: (ctx, snapshot) {
              //       if (snapshot.connectionState == ConnectionState.done) {
              //         debugPrint("=====snapshot========");

              //         print(snapshot.data);
              //         debugPrint("=============");

              //         return MyContainer(
              //           color: AppColor.backgroundColor,
              //           child: Column(
              //             children: [
              //               Row(
              //                 children: [
              //                   Text("عنوان الاستشارة"),
              //                   Text(snapshot.data!.title.toString()),
              //                 ],
              //               ),
              //               Row(
              //                 children: [
              //                   Text("اسم المريض"),
              //                   Text(snapshot.data!.patientName.toString()),
              //                 ],
              //               ),
              //               Row(
              //                 children: [
              //                   Text("الجنس"),
              //                   Text(snapshot.data!.gender.toString()),
              //                   MyHorizntalSize(
              //                     width: 90,
              //                   ),
              //                   Text("العمر"),
              //                   Text(snapshot.data!.age.toString()),
              //                 ],
              //               ),
              //               Row(
              //                 children: [
              //                   Text("وصف الاستشارة"),
              //                   Text(snapshot.data!.description.toString()),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         );
              //       } else {
              //         return Text("Error");
              //         // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error")));
              //       }
              //     }),
              MessageBubble(
                message: 'مرحبا انا الطبيب',
                isMe: true,
              ),
              // Icon(Icons.abc),
              MessageBubble(
                message: 'مرحبا أنا المريض',
                isMe: false,
              ),
              MessageBubble(
                message: 'مرحبا أنا 555',
                isMe: false,
              ),

              Row(
                children: [
                  Expanded(
                    flex: 9,
                    child: MyTextFormField(
                        hintText: ".....اكتب الرد هنا",
                        suffixIcon: IconButton(
                            onPressed: () {}, icon: Icon(Icons.send))),
                  ),
                  // Expanded(
                  //     child:
                  //         IconButton(onPressed: () {}, icon: Icon(Icons.send))),
                  Expanded(
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.insert_chart))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
