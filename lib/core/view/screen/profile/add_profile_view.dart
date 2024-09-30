import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/constant/app_color.dart';
import 'package:medical_consult_project/core/view/widget/my_circular_contanier.dart';
import 'package:medical_consult_project/core/view/widget/my_container.dart';
import 'package:medical_consult_project/core/view/widget/my_elevated_button.dart';
import 'package:medical_consult_project/core/view/widget/my_horizntal_size.dart';
import 'package:medical_consult_project/core/view/widget/my_text_form_field.dart';
import 'package:medical_consult_project/core/view/widget/my_vertical_size.dart';
import 'package:medical_consult_project/core/viewmodels/profile_vm.dart';
import 'package:medical_consult_project/helper/http_helper.dart';
import 'package:numberpicker/numberpicker.dart';

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
  final TextEditingController name = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController bio = TextEditingController();
  // final List<int> _morningFrom = List.filled(7, 0);
  // final List<int> _morningTo = List.filled(7, 0);
  // final List<int> _nightFrom = List.filled(7, 0);
  // final List<int> _nightTo = List.filled(7, 0);
  // final List<String> _hospitals = List.filled(7, '');

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
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(onPressed:() {
                                    Navigator.pop(context);
                                  }, icon: const Icon(Icons.camera_alt_outlined,size: 50,)),
                                  IconButton(onPressed:() {
                                    Navigator.pop(context);
                                  }, icon: const Icon(Icons.image,size: 50,))
                                ],
                              ),
                            ),
                          ),
                        ),
                    child: MyCircularContanier(
                      height: 200,
                      width: 200,
                      radius: 100,
                      color: Colors.green,
                    )),
                // Stack(
                //   children: <Widget>[
                //     Container(
                //       width: double.infinity,
                //       height: 200,
                //       margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                //       padding: EdgeInsets.only(top: 10,bottom: 10),
                //       decoration: BoxDecoration(
                //         border: Border.all(
                //           color: AppColor.primaryColor,
                //             //color: Color.fromARGB(255, 51, 204, 255),
                //             width: 1),
                //         borderRadius: BorderRadius.circular(5),
                //         shape: BoxShape.rectangle,
                //       ),
                //       child: SingleChildScrollView(
                //         child: Column(
                //           children: [
                //
                //           ],
                //         ),
                //       ),
                //     ),
                //     Positioned(
                //       right: 50,
                //       top: 12,
                //       child: Container(
                //        // padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                //         color: Colors.white,
                //         child: Text(
                //           'المعلومات الشخصية',
                //           style: TextStyle(color: Colors.black, fontSize: 12),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                MyTextFormField(
                  labelText: "الاسم",
                  controller:name ,
                ),
                MyTextFormField(
                  labelText: "الجوال",
                  controller: phone,
                ),
                MyTextFormField(
                  labelText: "المدينة",
                  controller: city,
                ),
                MyTextFormField(
                  labelText: "نبذة عنك:",
                  controller: bio,
                  height: 300,
                  maxLines: 10,
                  maxLength: 500,
                 // minLines: 3,
                ),

                MyElvatedButton(label: 'حفظ', onPressed: () {
                 profileVm.getProfileInfo();
                  //Navigator.pushNamed(context, '/displayProfile');

                  //HttpHelper.instsnse;

                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
