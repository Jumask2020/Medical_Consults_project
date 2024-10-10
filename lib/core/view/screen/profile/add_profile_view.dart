import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_consult_project/core/global/components/showLoadingComp.dart';
import 'package:medical_consult_project/core/model/profile.dart';

import 'package:medical_consult_project/core/view/widget/my_circular_contanier.dart';
import 'package:medical_consult_project/core/view/widget/my_text_form_field.dart';
import 'package:medical_consult_project/core/view/widget/my_vertical_size.dart';
import 'package:medical_consult_project/core/view_model/profile_v_m.dart';

import 'package:provider/provider.dart';

import '../../../global/components/imagepicker.dart';
import '../../../global/components/showDialog.dart';
import '../../widget/my_elevated_button.dart';

class AddProfileView extends StatelessWidget {
  AddProfileView({super.key});

  final ProfileVM profileVm = ProfileVM();
  final TextEditingController city = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController bio = TextEditingController();
  final TextEditingController mejar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Profile? profile = ModalRoute.settingsOf(context)!.arguments as Profile;
    if (profile != null) {
      city.text = profile.city!;
      phone.text = profile.phone!;
      bio.text = profile.bio!;
      mejar.text = profile.displayMajor!;
    }

    return ChangeNotifierProvider(
      create: (context) => ProfileVM(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('اضافة الملف الشخصي للدكتور'),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Consumer<ProfileVM>(builder: (context, p, child) {
                    return InkWell(
                      onTap: () => showDialog(
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
                                      onPressed: () async {
                                        p.getImage(await imagePicker(
                                            ImageSource.camera));
                                      },
                                      icon: const Icon(
                                        Icons.camera_alt_outlined,
                                        size: 50,
                                      )),
                                  IconButton(
                                      onPressed: () async {
                                        p.getImage(await imagePicker(
                                            ImageSource.gallery));
                                        print(p.pickerFile!.path);
                                      },
                                      icon: const Icon(
                                        Icons.image,
                                        size: 50,
                                      ))
                                ],
                              )),
                        ),
                      ),
                      child: MyCircularContanier(
                        pathImage: p.pickerFile?.path,
                      ),
                    );
                  }),
                  MyVerticalSize(
                    height: 20,
                  ),
                  MyTextFormField(
                    labelText: "الجوال",
                    controller: phone,
                    prefixIcon: Icon(Icons.phone),
                  ),
                  MyTextFormField(
                    labelText: "المدينة",
                    controller: city,
                    prefixIcon: Icon(Icons.location_city),
                  ),
                  MyTextFormField(
                    labelText: "التخصص",
                    controller: mejar,
                    prefixIcon: Icon(Icons.location_city),
                  ),
                  MyTextFormField(
                    labelText: "نبذة عنك",
                    controller: bio,
                    height: 100,
                    maxLines: 10,
                    maxLength: 500,
                    prefixIcon: Icon(Icons.description),
                    // minLines: 3,
                  ),
                  MyElvatedButton(
                      label: 'حفظ',
                      onPressed: () async {
                        // profileVm.profile.avatar =
                        Profile profile = Profile(
                          city: city.text,
                          bio: bio.text,
                          displayMajor: mejar.text,
                          phone: phone.text,
                        );
                        ShowLoadingFunction(context);
                        await profileVm.addProfile(profile).then((x) {
                          print(x);
                          if (x == 'Success') {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/home',
                              (route) => false,
                            );
                          } else {
                            showAlertDialog(context, x, '');
                          }
                        });
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
