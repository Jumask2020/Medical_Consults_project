import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/view/widget/my_container.dart';
import 'package:medical_consult_project/core/view/widget/my_elevated_button.dart';
import 'package:medical_consult_project/core/view_model/profile_v_m.dart';

class DisplayProfileScreen extends StatelessWidget {
  DisplayProfileScreen({super.key});
  ProfileVM profileVM = ProfileVM();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        actions: [
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.edit_square)),
                Text("تعدبل الملف الشخصي"),
              ],
            ),
          )
        ],
      ),
      body: FutureBuilder(
          future: profileVM.fetchProfile(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                children: [
                  MyContainer(
                    color: Colors.teal,
                    topLeft: 0,
                    topRight: 0,
                    bottomRight: 100,
                    height: MediaQuery.of(context).size.height / 4,
                  ),
                  Expanded(
                    flex: 1,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                            left: 10,
                            top: (MediaQuery.of(context).size.height / 800) -
                                100,
                            child: ClipRRect(
                              child: Image.asset(
                                "assets/images/doctor.png",
                                fit: BoxFit.fill,
                                height: 150,
                                width: 150,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(
                            height: 20,
                            thickness: 2,
                          ),
                          Text(
                            "الدكتور : ${snapshot.data?.name ?? "علي ماجد"}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'LBC',
                                fontSize: 15),
                          ),
                          Divider(
                            height: 20,
                            thickness: 2,
                          ),
                          Text(
                            "التخصص : ${snapshot.data?.displayMajor ?? "مخ وأعصاب"}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'jana',
                                fontSize: 15),
                          ),
                          Divider(
                            height: 20,
                            thickness: 2,
                          ),
                          Text(
                            "المدينة : ${snapshot.data?.city ?? "حضرموت"}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'jana',
                                fontSize: 15),
                          ),
                          Divider(
                            height: 20,
                            thickness: 2,
                          ),
                          Text(
                            "عن الطبيب : ${snapshot.data?.bio ?? "خريج جامعة حضرموت تخصص مخ وأعصاب"}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'jana',
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                  MyContainer(
                    color: Colors.teal,
                    topLeft: 100,
                    topRight: 0,
                    width: MediaQuery.of(context).size.width,
                    height: (MediaQuery.of(context).size.height / 4) - 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyElvatedButton(
                            backgroundColor: Colors.white,
                            textColor: Colors.teal,
                            label: 'تعديل',
                            onPressed: () {
                              debugPrint("presssed!!!!!!!!!!!");
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Pressed")));
                            }),
                      ],
                    ),
                  ),
                ],
              );
            }
          }),
    ));
  }
}
