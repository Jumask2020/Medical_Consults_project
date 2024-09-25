import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/constant/app_color.dart';
import 'package:medical_consult_project/core/view/widget/my_elevated_button.dart';
import 'package:medical_consult_project/core/view/widget/my_text_form_field.dart';
import 'package:medical_consult_project/core/view/widget/my_vertical_size.dart';
import 'package:medical_consult_project/helper/regExp_helper.dart';

class SigninView extends StatelessWidget {
   SigninView({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                height: 250,
                width: 250,
                'assets/images/logo.png',
                color: AppColor.secondaryColor,
              ),
              const MyTextFormField(
                validator: RegExpHelper.isUserEmailValide,
                boarderColor: AppColor.secondaryColor,
                prefixIcon: Icon(
                  Icons.email,
                  color: AppColor.secondaryColor,
                ),
                hintText: 'البريد الالكتروني',
                textColor: AppColor.secondaryColor,
                hintColor: AppColor.secondaryColor,
              ),
              const MyTextFormField(
                validator: RegExpHelper.isUserPassworValide,
                boarderColor: AppColor.secondaryColor,
                prefixIcon: Icon(
                  Icons.email,
                  color: AppColor.secondaryColor,
                ),
                hintText: ' كلمة المرور',
                hintColor: AppColor.secondaryColor,
                textColor: AppColor.secondaryColor,
                suffixIcon: Icon(
                  Icons.visibility_outlined,
                  color: AppColor.secondaryColor,
                ),
              ),
              const MyVerticalSize(),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                height: 200,
                decoration: const BoxDecoration(
                    color: AppColor.secondaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                child: Column(
                  children: [
                    Text(
                      'نسيت كلمة المرور',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    MyElvatedButton(label: 'تسجيل الدخول', onPressed: () {}),
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
                    MyElvatedButton(
                        textColor: Colors.black,
                        backgroundColor: AppColor.tertiaryColor,
                        label: 'إنشاء حساب جديد',
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
