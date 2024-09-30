import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/constant/app_color.dart';
import 'package:medical_consult_project/core/view/widget/my_elevated_button.dart';
import 'package:medical_consult_project/core/view/widget/my_text_form_field.dart';
import 'package:medical_consult_project/core/view/widget/my_vertical_size.dart';
import 'package:medical_consult_project/core/view_model/user_v_m.dart';
import 'package:medical_consult_project/helper/regExp_helper.dart';
import 'package:provider/provider.dart';

import '../../../model/user.dart';

class SigninView extends StatelessWidget {
   SigninView({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  final UserVM _userVM = UserVM();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserVM(),
      child: SafeArea(
        child: Consumer<UserVM>(builder: (context, u, child) {
          return u.isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: AppColor.primaryColor,
                  ),
                )
              : Scaffold(
                  backgroundColor: AppColor.primaryColor,
                  body: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          height: 250,
                          width: 250,
                          'assets/images/logo.png',
                          color: AppColor.secondaryColor,
                        ),
                        MyTextFormField(
                          controller: email,
                          validator: RegExpHelper.isUserEmailValide,
                          boarderColor: AppColor.secondaryColor,
                          prefixIcon: const Icon(
                            Icons.email,
                            color: AppColor.secondaryColor,
                          ),
                          hintText: 'البريد الالكتروني',
                          textColor: AppColor.secondaryColor,
                          hintColor: AppColor.secondaryColor,
                        ),
                        MyTextFormField(
                          controller: password,
                          validator: RegExpHelper.isUserPassworValide,
                          boarderColor: AppColor.secondaryColor,
                          obscureText: u.isVisible,

                          prefixIcon:  Icon(
                            Icons.password,
                            color: AppColor.secondaryColor,
                          ),
                          hintText: ' كلمة المرور',
                          hintColor: AppColor.secondaryColor,
                          textColor: AppColor.secondaryColor,
                          suffixIcon:  IconButton(
                              onPressed: (){
                                u.passwordVisible();
                              },

                            color: AppColor.secondaryColor, icon: Icon(u.isVisible? Icons.visibility_off_outlined:Icons.visibility,),)
                          ),

                         MyVerticalSize(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          width: double.infinity,
                          height: 200,
                          decoration: const BoxDecoration(
                              color: AppColor.secondaryColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(35),
                                  topRight: Radius.circular(35))),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const MyVerticalSize(),
                                Text(
                                  'نسيت كلمة المرور',
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                                const MyVerticalSize(),
                                MyElvatedButton(
                                    label: 'تسجيل الدخول',
                                    onPressed: () {
                                      debugPrint('sssssssssssssss');
                                      User user = User(
                                          email: email.text,
                                          password: password.text);
                                      _userVM.signIn(user).then((x) {
                                        if (x == 'Success') {
                                          Navigator.pushReplacementNamed(
                                              context, '/home');
                                        } else {
                                          AwesomeDialog(
                                              context: context, body: Text(x));
                                        }
                                      });
                                    }),
                                const MyVerticalSize(
                                  height: 5,
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        width: 100,
                                        child: Divider(
                                          color: Colors.black,
                                        )),
                                    Text('  أو  '),
                                    SizedBox(
                                        width: 100,
                                        child: Divider(
                                          color: Colors.black,
                                        )),
                                  ],
                                ),
                                const MyVerticalSize(
                                  height: 5,
                                ),
                                MyElvatedButton(
                                    textColor: Colors.black,
                                    backgroundColor: AppColor.tertiaryColor,
                                    label: 'إنشاء حساب جديد',
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/signup');
                                    })
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
        }),
      ),
    );
  }
}
