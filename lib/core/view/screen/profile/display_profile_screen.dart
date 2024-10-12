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
      backgroundColor: Colors.cyan[700],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.edit_square)),
              Text("تعدبل الملف الشخصي"),
            ],
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
                  Image.asset(
                    "assets/images/doctor.png",
                    fit: BoxFit.fill,
                  ),
                  Expanded(
                    child: Stack(
                      //clipBehavior: Clip.none,
                      children: [
                        MyContainer(
                          height: MediaQuery.of(context).size.height,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Stack(clipBehavior: Clip.none, children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(snapshot.data?.name ?? "",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'LBC',
                                              fontSize: 20)),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.message,
                                            color: Colors.amber,
                                          )),
                                    ],
                                  ),
                                ),
                                Positioned(
                                    top: 45,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        snapshot.data?.displayMajor ?? "",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'jana',
                                            fontSize: 15),
                                      ),
                                    )),
                                Positioned(
                                  top: 65,
                                  right: 0,
                                  left: 0,
                                  // bottom: -200,
                                  child: Divider(
                                    height: 20,
                                    thickness: 2,
                                  ),
                                ),
                                Positioned(
                                  bottom: -55,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Text(
                                      "المدينة",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'LBC',
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: -85,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      snapshot.data?.city ?? "",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'jana',
                                          fontSize: 15),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 125,
                                  right: 0,
                                  left: 0,
                                  // bottom: -200,
                                  child: Divider(
                                    height: 20,
                                    thickness: 2,
                                  ),
                                ),
                                Positioned(
                                  bottom: -120,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Text(
                                      "معلومات عن الطبيب",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'LBC',
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: 170,
                                    bottom: -250,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(snapshot.data?.bio ?? ""),
                                    )),

                                //"fhfghfghfghfjlfjf\nghhfghfghgf\nfggfhgfdghd\ndfgjkgfdgkd\nfgjsfksdhfkhgkdhgghfghfhgd\njkgdbgdfk\nfngjdngjsdfngkds\nfgdsgnjd\ngdgfhgkdfhgkshgjhfghfhdgshgfdsjgfjdsgfjsdgfgfsjhfghgf\nfgngfhfgh\fgngfhfghfg\ngfخريح جامعة غزة في فلسطين ")),
                                Positioned(
                                    bottom: -300,
                                    right: 0,
                                    left: 0,
                                    child: MyElvatedButton(
                                        label: 'تعديل',
                                        onPressed: () {
                                          debugPrint("presssed!!!!!!!!!!!");
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text("Pressed")));
                                        })),
                              ])
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            }
          }),
    ));
  }
}
