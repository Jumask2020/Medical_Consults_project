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
              }
              return MyContainer(
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
                                  image: snapshot.data!.avatar !=
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
                            Navigator.pushNamed(context, '/addProfile',
                                arguments: snapshot.data);
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

  Future<String?> imagePicker(ImageSource source) async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: source);
    return image?.path;
  }

  void _showDailogImage(BuildContext context, String? pathImage) {
    showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: SizedBox(
          width: 100,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () async {
                    pathImage = await imagePicker(ImageSource.camera);
                    print(pathImage);
                  },
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    size: 50,
                  )),
              IconButton(
                  onPressed: () async {
                    pathImage = await imagePicker(ImageSource.gallery);
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
}
