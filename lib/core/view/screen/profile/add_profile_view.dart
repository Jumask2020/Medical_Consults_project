import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_consult_project/core/constant/app_color.dart';
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

  // Variable to hold the selected value of the dropdown
  String? selectedSpecialization;
  File? filePath;
  int?index;
  @override
  Widget build(BuildContext context) {
    Profile? profile = ModalRoute.of(context)!.settings.arguments as Profile;
    if (profile != null) {
      city.text = profile.city??'';
      phone.text = profile.phone??'';
      bio.text = profile.bio??'';
      mejar.text = profile.displayMajor??'';
      // selectedSpecialization = profile.categoryId.toString();
    }
    return ChangeNotifierProvider(
      create: (context) => ProfileVM(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.primaryColor,
            title: Text(
              'إضافة الملف الشخصي',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
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

                    Consumer<ProfileVM>(builder: (context, p, child) {
                      return InkWell(
                        onTap: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),

                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.camera_alt_outlined, size: 50, color:AppColor.primaryColor),
                                      onPressed: () async {
                                        Navigator.pop(context);
                                       filePath = p.getImage(await imagePicker(ImageSource.camera));
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.image, size: 50, color: AppColor.primaryColor),
                                      onPressed: () async {
                                        Navigator.pop(context); // إغلاق الـ Dialog
                                       filePath = p.getImage(await imagePicker(ImageSource.gallery));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),

                        child: MyCircularContanier(
                          pathImage: p.pickerFile?.path,
                        ),
                      );
                    }),
                    MyVerticalSize(height: 30),
                    // إدخال الجوال
                    MyTextFormField(
                      horizontal: 0,

                      labelText: "رقم الجوال",
                      controller: phone,
                      prefixIcon: Icon(Icons.phone),
                    ),

                    // إدخال المدينة
                    MyTextFormField(
                      horizontal: 0,
                      labelText: "المدينة",
                      controller: city,
                      prefixIcon: Icon(Icons.location_city),
                    ),

                    // إدخال التخصص
                    MyTextFormField(
                      horizontal: 0,

                      labelText: "التخصص",
                      controller: mejar,
                      prefixIcon: Icon(Icons.school),
                    ),

                    MyTextFormField(
                      horizontal: 0,

                      labelText: "نبذة عنك",
                      controller: bio,
                      height: 100,
                      maxLines: 10,
                      maxLength: 500,
                      prefixIcon: Icon(Icons.description),
                    ),
                    MyVerticalSize(height: 20),

                    Consumer<ProfileVM>(
                      builder: (context,p,child) {
                        return DropdownButtonFormField<String>(

                          decoration: InputDecoration(

                            labelText: "اختر التخصص",
                            prefixIcon: Icon(Icons.category),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          value: selectedSpecialization ,
                          items: p.nameSpac.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            selectedSpecialization = newValue;

                            p.selectedSpec();
                          },
                        );
                      }
                    ),
                    MyVerticalSize(height: 20),
                    // إدخال النبذة

                    // زر حفظ
                    MyElvatedButton(
                      label: 'حفظ',
                      onPressed: () async {

                        Profile profile = Profile(
                          city: city.text,
                          bio: bio.text,
                          displayMajor: mejar.text,
                          phone: phone.text,

                          categoryId: index
                        );
                        ShowLoadingFunction(context);
                        await profileVm.addProfile(profile,filePath: filePath).then((x) {
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
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
