// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/constant/app_color.dart';
import 'package:medical_consult_project/core/model/user.dart';
import 'package:medical_consult_project/core/view/widget/my_elevated_button.dart';
import 'package:medical_consult_project/core/view/widget/my_text_form_field.dart';
import 'package:medical_consult_project/core/view/widget/my_vertical_size.dart';
import 'package:medical_consult_project/core/view_model/user_v_m.dart';
import 'package:medical_consult_project/helper/regExp_helper.dart';
import 'package:provider/provider.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  final UserVM _userVM = UserVM();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserVM(),
      child: Consumer<UserVM>(builder: (context, u, child) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: u.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          backgroundColor: AppColor.primaryColor,
                        ),
                      )
                    : Column(
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                                Text(
                                  'تسجيل الدخول ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                              ],
                            ),
                          ),
                          const MyVerticalSize(
                            height: 30,
                          ),
                          MyTextFormField(
                            controller: name,
                            validator: RegExpHelper.isUserNameValide,
                            labelText: 'الاسم الثلاثي',
                            prefixIcon: const Icon(Icons.person),
                          ),
                          MyTextFormField(
                            controller: email,
                            validator: RegExpHelper.isUserEmailValide,
                            labelText: ' البريد الالكتروني',
                            prefixIcon: const Icon(Icons.email_outlined),
                          ),
                          MyTextFormField(
                            controller: password,
                            obscureText: u.isVisible,
                            validator: RegExpHelper.isUserPassworValide,
                            labelText: ' كلمة المرور',
                            suffixIcon: IconButton(
                                onPressed: () {
                                  u.passwordVisible();
                                },
                                icon: Icon(u.isVisible
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility)),
                            prefixIcon: const Icon(Icons.password),
                          ),
                          MyTextFormField(
                            controller: confirmPassword,
                            validator: (val) {
                              if (val != password.text) {
                                return 'كلمة المرور خاطئه';
                              }
                              return null;
                            },
                            labelText: '  تأكيد كلمة المرور',
                            obscureText: u.isVisible,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  u.passwordVisible();
                                },
                                icon: Icon(u.isVisible
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility)),
                            prefixIcon: const Icon(Icons.password),
                          ),

                          const MyVerticalSize(
                            height: 30,
                          ),
                          MyElvatedButton(
                              label: 'تسجيل',
                              onPressed: () async {
                                // if (formKey.currentState!.validate()) {
                                // if (u.isAccept) {
                                User user = User(
                                  name: name.text,
                                  email: email.text,
                                  password: password.text,
                                  passwordConfirmation: confirmPassword.text,
                                  role: 'Doctor',
                                );
                                _userVM.signUp(user).then((x) {
                                  debugPrint(x);
                                  if (x == 'Success') {
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      '/addProfile',
                                      (route) => false,
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("data")));
                                    // AwesomeDialog(
                                    //         context: context,
                                    //         body: Text(x),
                                    //         animType: AnimType.topSlide)
                                    //     .show();
                                  }
                                });
                                // const Center(
                                //   child: CircularProgressIndicator(),
                                // );
                                // }
                              }),
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
          ),
        );
      }),
    );
  }
}
