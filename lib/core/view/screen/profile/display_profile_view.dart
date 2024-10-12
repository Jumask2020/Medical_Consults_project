import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_consult_project/core/constant/app_color.dart';
import 'package:medical_consult_project/core/view/widget/my_circular_contanier.dart';
import 'package:medical_consult_project/core/view/widget/my_container.dart';
import 'package:medical_consult_project/core/view/widget/my_elevated_button.dart';
import 'package:medical_consult_project/core/view/widget/my_horizntal_size.dart';
import 'package:medical_consult_project/core/view/widget/my_vertical_size.dart';
import 'package:medical_consult_project/core/view_model/profile_v_m.dart';
import 'package:medical_consult_project/helper/storge_helper.dart';

class DisplayProfileView extends StatelessWidget {
  DisplayProfileView({super.key});

  final ProfileVM profileVM = ProfileVM();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              Icon(
                Icons.person_search_rounded,
                textDirection: TextDirection.ltr,
              ),
              Text("     الملف التعريفي بالطبيب"),
            ],
          ),
        ),
        body: FutureBuilder(
            future: profileVM.fetchProfile(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }else if(snapshot.hasError){
                return Center(child: Text('حدث خطا ما!',style: TextStyle(fontSize: 20),),);
              }
              return MyContainer(
                gradient: LinearGradient(

                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.teal[300]!,
                      Colors.teal[100]!,
                ]),
                height: MediaQuery.of(context).size.height,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                topLeft: 10,
                topRight: 10,
                bottomLeft: 10,
                bottomRight: 10,
                color: AppColor.backgroundColor,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                  image: snapshot.data?.avatar !=
                                          'https://cons.actnow-ye.com/'
                                      ? NetworkImage(snapshot.data!.avatar!)
                                      : const AssetImage(
                                          "assets/images/accountDoctor.png")
                                  // image: DecorationImage( image: AssetImage("assets/images/$assetName"??"assets/images/accountDoctor.png")
                                  ,
                                  fit: BoxFit.fill),
                            ),
                          ),
                          const MyHorizntalSize(),
                          Column(
                            children: [
                              Text(snapshot.data?.name ?? ""),
                              Text(snapshot.data?.email ?? ""),
                              Text(snapshot.data?.phone ?? ""),
                              Text(snapshot.data?.categoryId.toString() ?? ""),
                            ],
                          ),
                        ],
                      ),
                      const MyVerticalSize(),
                      const MyHorizntalSize(
                          width: 900,
                          child: Divider(color: Colors.grey, thickness: 1)),
                      const Row(
                        children: [
                          //filter_frames icons
                          Icon(
                            Icons.note_alt,
                            textDirection: TextDirection.ltr,
                          ),
                          Text(" نبذة عن الطبيب"),
                        ],
                      ),
                      Text(snapshot.data?.bio ?? ""),
                      const MyVerticalSize(),
                      const MyHorizntalSize(
                          width: 900,
                          child: Divider(color: Colors.grey, thickness: 1)),
                      Row(
                        children: [
                          const Icon(
                            Icons.pin_drop_outlined,
                            textDirection: TextDirection.ltr,
                          ),
                          const Text(" المدينة:"),
                          Text(snapshot.data?.city ?? ""),
                        ],
                      ),
                      MyVerticalSize(),
                      MyElvatedButton(

                          label: ' تعديل الملف الشخصي',
                          onPressed: () {
                            profileVM.getAllCategries();
                            Navigator.pushNamed(context, '/addProfile',
                                arguments: snapshot.data
                            );
                          }),
                      const MyVerticalSize(),
                      MyElvatedButton(
                          label: 'تسجيل الخروج',
                          onPressed: () {
                            StorgeHelper.instance.deleteAllKey();
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/signin',
                              (route) => false,
                            );
                          })
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
  //
  // Future<String?> imagePicker(ImageSource source) async {
  //   ImagePicker picker = ImagePicker();
  //   XFile? image = await picker.pickImage(source: source);
  //   return image?.path;
  // }
  //
  // void _showDailogImage(BuildContext context, String? pathImage) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) => Dialog(
  //       child: SizedBox(
  //         width: 100,
  //         height: 100,
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: [
  //             IconButton(
  //                 onPressed: () async {
  //                   pathImage = await imagePicker(ImageSource.camera);
  //                   print(pathImage);
  //                 },
  //                 icon: const Icon(
  //                   Icons.camera_alt_outlined,
  //                   size: 50,
  //                 )),
  //             IconButton(
  //                 onPressed: () async {
  //                   pathImage = await imagePicker(ImageSource.gallery);
  //                   print(pathImage);
  //                 },
  //                 icon: const Icon(
  //                   Icons.image,
  //                   size: 50,
  //                 ))
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

// import 'package:flutter/material.dart';
// import 'package:medical_consult_project/core/view/widget/my_container.dart';
// import 'package:medical_consult_project/core/view/widget/my_elevated_button.dart';
// import 'package:medical_consult_project/core/view_model/profile_v_m.dart';
//
// class DisplayProfileView extends StatelessWidget {
//   DisplayProfileView({super.key});
//   ProfileVM profileVM = ProfileVM();
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//           backgroundColor: Colors.cyan[700],
//           appBar: AppBar(
//             backgroundColor: Colors.transparent,
//             actions: [
//               Row(
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 // crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   IconButton(onPressed: () {}, icon: Icon(Icons.edit_square)),
//                   Text("تعدبل الملف الشخصي"),
//                 ],
//               )
//             ],
//           ),
//           body: FutureBuilder(
//               future: profileVM.fetchProfile(),
//               builder: (ctx, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 } else {
//                   return Column(
//                     children: [
//                       Image.asset(
//                         height: 180,
//                         "assets/images/logo.png",
//                         fit: BoxFit.fill,
//                       ),
//                       Expanded(
//                         child: Stack(
//                           //clipBehavior: Clip.none,
//                           children: [
//                             MyContainer(
//                               height: MediaQuery.of(context).size.height,
//                               color: Colors.white,
//                               child: Column(
//                                 children: [
//                                   Stack(clipBehavior: Clip.none, children: [
//                                     Padding(
//                                       padding:
//                                       const EdgeInsets.symmetric(horizontal: 5),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(snapshot.data?.name ?? "",
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.bold,
//                                                   fontFamily: 'LBC',
//                                                   fontSize: 20)),
//                                           IconButton(
//                                               onPressed: () {},
//                                               icon: Icon(
//                                                 Icons.message,
//                                                 color: Colors.amber,
//                                               )),
//                                         ],
//                                       ),
//                                     ),
//                                     Positioned(
//                                         top: 45,
//                                         child: Padding(
//                                           padding: const EdgeInsets.symmetric(
//                                               horizontal: 10),
//                                           child: Text(
//                                             snapshot.data?.displayMajor ?? "",
//                                             style: TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 fontFamily: 'jana',
//                                                 fontSize: 15),
//                                           ),
//                                         )),
//                                     Positioned(
//                                       top: 65,
//                                       right: 0,
//                                       left: 0,
//                                       // bottom: -200,
//                                       child: Divider(
//                                         height: 20,
//                                         thickness: 2,
//                                       ),
//                                     ),
//                                     Positioned(
//                                       bottom: -55,
//                                       child: Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 5),
//                                         child: Text(
//                                           "المدينة",
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: 'LBC',
//                                               fontSize: 20),
//                                         ),
//                                       ),
//                                     ),
//                                     Positioned(
//                                       bottom: -85,
//                                       child: Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 10),
//                                         child: Text(
//                                           snapshot.data?.city ?? "",
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: 'jana',
//                                               fontSize: 15),
//                                         ),
//                                       ),
//                                     ),
//                                     Positioned(
//                                       top: 125,
//                                       right: 0,
//                                       left: 0,
//                                       // bottom: -200,
//                                       child: Divider(
//                                         height: 20,
//                                         thickness: 2,
//                                       ),
//                                     ),
//                                     Positioned(
//                                       bottom: -120,
//                                       child: Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 5),
//                                         child: Text(
//                                           "معلومات عن الطبيب",
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: 'LBC',
//                                               fontSize: 20),
//                                         ),
//                                       ),
//                                     ),
//                                     Positioned(
//                                         top: 170,
//                                         bottom: -250,
//                                         child: Padding(
//                                           padding: const EdgeInsets.symmetric(
//                                               horizontal: 10),
//                                           child: Text(snapshot.data?.bio ?? ""),
//                                         )),
//
//                                     //"fhfghfghfghfjlfjf\nghhfghfghgf\nfggfhgfdghd\ndfgjkgfdgkd\nfgjsfksdhfkhgkdhgghfghfhgd\njkgdbgdfk\nfngjdngjsdfngkds\nfgdsgnjd\ngdgfhgkdfhgkshgjhfghfhdgshgfdsjgfjdsgfjsdgfgfsjhfghgf\nfgngfhfgh\fgngfhfghfg\ngfخريح جامعة غزة في فلسطين ")),
//                                     Positioned(
//                                         bottom: -220,
//                                         right: 5,
//                                         left: 5,
//                                         child: MyElvatedButton(
//                                             label: 'تعديل',
//                                             onPressed: () {
//                                               debugPrint("presssed!!!!!!!!!!!");
//                                               ScaffoldMessenger.of(context)
//                                                   .showSnackBar(SnackBar(
//                                                   content: Text("Pressed")));
//                                             })),
//                                   ])
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       )
//                     ],
//                   );
//                 }
//               }),
//         ));
//   }
// }