import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/constant/app_color.dart';
// import 'package:medical_consult_project/core/global/components/isPdfFile.dart';
import 'package:medical_consult_project/core/model/consult.dart';
import 'package:medical_consult_project/core/view/widget/my_circular_contanier.dart';
import 'package:medical_consult_project/core/view/widget/my_container.dart';
import 'package:medical_consult_project/core/view/widget/my_elevated_button.dart';
import 'package:medical_consult_project/core/view/widget/my_horizntal_size.dart';
import 'package:medical_consult_project/core/view_model/consult_v_m.dart';
import 'package:provider/provider.dart';

import '../../../global/constant/isImageFile.dart';

class ConsultDetails extends StatelessWidget {
  ConsultDetails({super.key});

  final ConsultVM _consultVM = ConsultVM();

  @override
  Widget build(BuildContext context) {
    Consult? consult = ModalRoute.of(context)!.settings.arguments as Consult;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          actions: [
            //Switch(value: value, onChanged: onChanged)
            IconButton(
                onPressed: () {
                  _consultVM.closeConsult(consult.id);
                },
                icon: Icon(Icons.exit_to_app)),
            // Text("${consult.id}")
          ],
          title: Row(
            children: [
              Icon(Icons.text_snippet, color: Colors.white),
              SizedBox(width: 10),
              Text(
                "تفاصيل الاستشارة",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyContainer(
                margin: EdgeInsets.all(10),
                topLeft: 10,
                topRight: 10,
                bottomLeft: 10,
                bottomRight: 10,
                height: MediaQuery.of(context).size.height / 3,
                // image: DecorationImage(
                // image: AssetImage("assets/images/logo.jpg")),
                child: Row(
                  children: [
                    Image.asset("assets/images/logo.jpg"),
                    Column(
                      children: [
                        Text("الاسم : ${consult.patient!.name}"),
                        Text("الجنس : ${consult.patient!.gender}"),
                        Text("العمر : ${consult.patient!.age}"),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppColor.secondaryColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // معلومات المريض
                    Row(
                      children: [
                        MyCircularContanier(
                            assetName: "assets/images/logo.jpg"),
                        MyHorizntalSize(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              consult.patient!.name!,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text("الجنس: ${consult.patient!.age!}"),
                            SizedBox(height: 5),
                            Text("العمر: ${consult.patient!.age!}"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    // عنوان الاستشارة
                    Row(
                      children: [
                        Icon(Icons.text_snippet_outlined,
                            color: Colors.green[700]),
                        SizedBox(width: 10),
                        Text(
                          consult.title!,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Divider(color: Colors.grey[300], thickness: 1),
                    SizedBox(height: 10),
                    // وصف الاستشارة
                    Container(
                      child: Text(consult.description!),
                      color: AppColor.secondaryColor,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(15),
                    ),
                    SizedBox(height: 30),
                    // المرفقات الطبية
                    Row(
                      children: [
                        Icon(Icons.insert_drive_file_outlined,
                            color: Colors.green[700]),
                        SizedBox(width: 10),
                        Text(
                          "المرفقات الطبية",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Divider(color: Colors.grey[300], thickness: 1),
                    SizedBox(height: 10),
                    // isImageFile(consult.attachedFile!)
                    //     ? GestureDetector(
                    //         onTap: () {
                    //           Navigator.pushNamed(context, '/imageView',
                    //               arguments: consult.attachedFile!);
                    //         },
                    //         child: Container(
                    //           padding: const EdgeInsets.symmetric(
                    //               vertical: 10, horizontal: 15),
                    //           margin: const EdgeInsets.symmetric(vertical: 5),
                    //           width: 200,
                    //           height: 200,
                    //           child: Image.network(
                    //             semanticLabel: 'صورة',
                    //             consult.attachedFile!,
                    //             // width: 150,
                    //             // height: 150,

                    //             fit: BoxFit.fill,
                    //           ),
                    //         ),
                    //       )
                    //     : isPdfFile(consult.attachedFile!)
                    //         ? GestureDetector(
                    //             onTap: () {
                    //               // Show PDF in full screen
                    //               Navigator.pushNamed(context, '/pdfView',
                    //                   arguments: consult.attachedFile);
                    //             },
                    //             child: Row(
                    //               children: [
                    //                 const Icon(Icons.picture_as_pdf,
                    //                     color: Colors.red),
                    //                 const SizedBox(width: 8),
                    //                 Expanded(
                    //                   child: Text(
                    //                     consult.attachedFile?.split('/').last ??
                    //                         'PDF File',
                    //                     overflow: TextOverflow.ellipsis,
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           )
                    //         : Text('لايوجد ملف مرفق'),

                    SizedBox(height: 30),
                    ListTile(
                      title: Text("إغلاق الإستشارة"),
                      trailing: Selector<ConsultVM, bool>(
                        selector: (context, consultVM) => consultVM.isSelected,
                        builder: (context, isSelected, child) {
                          return Switch(
                              value: _consultVM.isSelected,
                              onChanged: (bool value) {
                                Provider.of<ConsultVM>(context, listen: false);
                                _consultVM.closeConsult(consult.id);
                              });
                        },
                      ),
                    ),
                    SizedBox(height: 30),

                    MyElvatedButton(
                      label: "رد",
                      onPressed: () {
                        Navigator.pushNamed(context, "/chatting",
                            arguments: consult.id.toString());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
