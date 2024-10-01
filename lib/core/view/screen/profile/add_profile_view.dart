import 'package:flutter/material.dart';

import 'package:medical_consult_project/core/view/widget/my_circular_contanier.dart';
import 'package:medical_consult_project/core/view/widget/my_text_form_field.dart';

import 'package:medical_consult_project/core/viewmodels/profile_vm.dart';

import '../../widget/my_elevated_button.dart';


class AddProfileView extends StatelessWidget {
  AddProfileView({super.key});
  ProfileVm profileVm=ProfileVm();
  final List<bool> _checkboxValues = List.generate(7, (index) => false);
  final List<String> _days = [
    'السبت',
    'الاحد',
    'الإثنين',
    'الثلاثاء',
    'الاربعاء',
    'الخميس',
    'الجمعة'
  ];
  // final TextEditingController name = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController bio = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
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
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                        Icons.camera_alt_outlined,
                                        size: 50,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                        Icons.image,
                                        size: 50,
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                    child: const MyCircularContanier(
                      height: 200,
                      width: 200,
                      radius: 100,
                      color: Colors.green,
                    )),

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
                  labelText: "نبذة عنك",
                  controller: bio,
                  height: 300,
                  maxLines: 10,
                  maxLength: 500,
                  prefixIcon: Icon(Icons.description),
                  // minLines: 3,
                ),

                MyElvatedButton(label: 'حفظ', onPressed: () {
                 profileVm.getProfileInfo();
                  //Navigator.pushNamed(context, '/displayProfile');

                  //HttpHelper.instsnse;

                      Navigator.pushNamed(context, '/displayProfile');
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
