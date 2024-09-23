import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/constant/app_color.dart';
import 'package:medical_consult_project/core/view/widget/my_elevated_button.dart';
import 'package:medical_consult_project/core/view/widget/my_text_form_field.dart';
import 'package:medical_consult_project/core/view/widget/my_vertical_size.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 120,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'سجل',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    Text(
                      'تسجيل الدخول ',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ],
                ),
              ),
              const MyVerticalSize(
                height: 30,
              ),
              const MyTextFormField(
                labelText: 'الاسم الثلاثي',
                prefixIcon: Icon(Icons.person),
              ),
              const MyTextFormField(
                labelText: ' البريد الالكتروني',
                prefixIcon: Icon(Icons.email_outlined),
              ),
              const MyTextFormField(
                labelText: ' كلمة المرور',
                prefixIcon: Icon(Icons.person),
              ),
              const MyTextFormField(
                labelText: '  تأكيد كلمة المرور',
                prefixIcon: Icon(Icons.email_outlined),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  children: [
                    Checkbox(
                        fillColor:
                            const WidgetStatePropertyAll(AppColor.primaryColor),
                        value: true,
                        onChanged: (val) {}),
                    const Text(
                      'أوافق على جميع الشروط والاحكام',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              MyElvatedButton(label: 'تسجيل', onPressed: () {}),
              const MyVerticalSize(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'هل لديك حساب بالفعل ؟ ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/signin');
                      },
                      child: const Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    )
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
