import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/constant/app_color.dart';
import 'package:medical_consult_project/core/global/components/showLoading.dart';
import 'package:medical_consult_project/core/view/widget/my_elevated_button.dart';
import 'package:medical_consult_project/core/view/widget/my_text_form_field.dart';
import 'package:medical_consult_project/core/view/widget/my_vertical_size.dart';
import 'package:medical_consult_project/core/view_model/user_v_m.dart';
import 'package:medical_consult_project/core/global/components/showDialog.dart';
import 'package:medical_consult_project/helper/regExp_helper.dart';
import 'package:provider/provider.dart';

import '../../../model/user.dart';

class SigninView extends StatelessWidget {
  SigninView({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
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
            key: scaffoldKey,
            backgroundColor: AppColor.primaryColor,
            body: Stack(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  // bottom: MediaQuery.of(context).size.height -250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        height: 250,
                        width: 250,
                        'assets/images/logo.png',
                        color: AppColor.secondaryColor,
                      ),
                      MyTextFormField(
                        cursorColor: AppColor.secondaryColor,

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
                          cursorColor: AppColor.secondaryColor,
                          controller: password,
                          validator: RegExpHelper.isUserPassworValide,
                          boarderColor: AppColor.secondaryColor,
                          obscureText: u.isVisible,
                          prefixIcon: const Icon(
                            Icons.password,
                            color: AppColor.secondaryColor,
                          ),
                          hintText: ' كلمة المرور',
                          hintColor: AppColor.secondaryColor,
                          textColor: AppColor.secondaryColor,
                          suffixIcon: IconButton(
                            onPressed: () {
                              u.passwordVisible();
                            },
                            color: AppColor.secondaryColor,
                            icon: Icon(
                              u.isVisible
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility,
                            ),
                          )),
                      const MyVerticalSize(),
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height-250 ,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    height: 200,
                    decoration: const BoxDecoration(
                        color: AppColor.secondaryColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35))),
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
                              ShowLoading(context);
                              User user = User(
                                  email: email.text,
                                  password: password.text);
                              _userVM.signIn(user).then((x) {
                                if (x == 'Success') {
                                  Navigator.pushReplacementNamed(
                                      context, '/home');
                                } else {
                                  showAlertDialog(context,'' ,x.toString());
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
          );
        }),
      ),
    );
  }

}