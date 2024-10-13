import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:medical_consult_project/core/constant/app_color.dart';
import 'package:medical_consult_project/core/view/screen/consults/chatting_view.dart';
import 'package:medical_consult_project/core/view/screen/consults/new_consults_view.dart';
import 'package:medical_consult_project/core/view/screen/profile/display_profile_view.dart';
import 'package:medical_consult_project/core/view/widget/my_circular_contanier.dart';
import 'package:medical_consult_project/core/view/widget/my_container.dart';
import 'package:medical_consult_project/core/view/widget/my_horizntal_size.dart';
import 'package:medical_consult_project/core/view/widget/my_vertical_size.dart';
import 'package:medical_consult_project/core/view_model/consult_v_m.dart';
import 'package:medical_consult_project/core/view_model/profile_v_m.dart';

class DashBoardView extends StatelessWidget {
  DashBoardView({super.key});
  ProfileVM profileVM = ProfileVM();
  ConsultVM consultVM = ConsultVM();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("الرئيسية"),
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder(
          future: consultVM.fetchAllConsult(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        // clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: 3,
                            left: 5,
                            right: 5,
                            child: MyContainer(
                              margin: EdgeInsets.only(
                                top: 50,
                              ),
                              topRight: 30,
                              topLeft: 30,
                              color: Colors.teal,
                              image: DecorationImage(
                                image: AssetImage("assets/images/back.jpg"),
                                fit: BoxFit.cover,
                              ),
                              height: 200,
                              width: 200,
                            ),
                          ),
                          Positioned(
                            right: 120,
                            child: MyCircularContanier(
                              radius: 80,
                            ),
                          ),
                          Positioned(
                              top: 100,
                              // right: 90,
                              left: 10,
                              right: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "مرحبًا",
                                    style: TextStyle(
                                        fontFamily: 'LBC',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  MyVerticalSize(
                                    height: 20,
                                  ),
                                  Text(
                                    ".د${profileVM.doctorName ?? ""}",
                                    style: TextStyle(
                                        fontFamily: 'LBC',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              )),
                          Positioned(
                            top: 260,
                            right: 5,
                            child: Row(
                              children: [
                                Text(
                                  "ملخص العمليات",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'LBC',
                                      fontSize: 20),
                                ),
                                MyHorizntalSize(
                                  width: 3,
                                ),
                                SpinKitWave(
                                  size: 20,
                                  color: Colors.teal,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Grid view at the bottom
                    Container(
                      height: 200, // Set height for the grid
                      child: GridView.count(
                        crossAxisCount: 2, // Number of columns
                        childAspectRatio: 2,
                        // Aspect ratio of child items
                        children: [
                          Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            //color: Colors.transparent,
                            child: Column(
                              children: [
                                SizedBox(height: 8),
                                Text("${consultVM.getWaitingPatientCount()}",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber)),
                                SizedBox(height: 2),
                                Text("الاستشارات المنتظرة",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'LBC',
                                        fontSize: 16,
                                        color: Colors.amber)),
                                // ClipRRect(
                                //   borderRadius: BorderRadius.vertical(
                                //       top: Radius.circular(15)),
                                //   child: Image.asset(
                                //     'assets/images/doctor.png', // Your image path
                                //     height: double.infinity,
                                //     width: double.infinity,
                                //     fit: BoxFit.cover,
                                //   ),
                                //   ),
                              ],
                            ),
                          ),
                          Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                SizedBox(height: 8),
                                Text("${consultVM.getWaitingDoctorCount()}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'LBC',
                                        fontSize: 30,
                                        color: Colors.teal)),
                                SizedBox(height: 2),
                                Text("جميع الإستشارات",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'LBC',
                                        fontSize: 16,
                                        color: Colors.teal)),
                                // ClipRRect(
                                //   borderRadius: BorderRadius.vertical(
                                //       top: Radius.circular(15)),
                                //   child: Image.asset(
                                //     'assets/images/doctor.png', // Your image path
                                //     height: double.infinity,
                                //     width: double.infinity,
                                //     fit: BoxFit.cover,
                                //   ),
                                //   ),
                              ],
                            ),
                          ),
                          Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                SizedBox(height: 8),
                                Text("${consultVM.getRejectCount()}",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            255, 255, 7, 7))),
                                SizedBox(height: 2),
                                Text("الاستشارات المرفوضة",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'LBC',
                                        fontSize: 16,
                                        color: const Color.fromARGB(
                                            255, 255, 7, 7))),
                                // ClipRRect(
                                //   borderRadius: BorderRadius.vertical(
                                //       top: Radius.circular(15)),
                                //   child: Image.asset(
                                //     'assets/images/doctor.png', // Your image path
                                //     height: double.infinity,
                                //     width: double.infinity,
                                //     fit: BoxFit.cover,
                                //   ),
                                //   ),
                              ],
                            ),
                          ),
                          Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                SizedBox(height: 8),
                                Text("${consultVM.getCompleteCount()}",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green[500])),
                                SizedBox(height: 2),
                                Text("الاستشارات المكتلمة",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'LBC',
                                        fontSize: 16,
                                        color: Colors.green[500])),
                                // ClipRRect(
                                //   borderRadius: BorderRadius.vertical(
                                //       top: Radius.circular(15)),
                                //   child: Image.asset(
                                //     'assets/images/doctor.png', // Your image path
                                //     height: double.infinity,
                                //     width: double.infinity,
                                //     fit: BoxFit.cover,
                                //   ),
                                //   ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
      bottomNavigationBar: BottomNavigationBar(
        // onTap: _onItemTapped,
        backgroundColor: AppColor.secondaryColor,
        unselectedItemColor: AppColor.primaryColor,
        selectedItemColor: Colors.teal,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        //  currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(null),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(4.0),
        child: FloatingActionButton(
          hoverElevation: 10,
          splashColor: Colors.grey,
          tooltip: 'Home',
          elevation: 5,
          child: Icon(Icons.home),
          onPressed: () {
            // Navigate to the desired page
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewConsultsView()));
          },
        ),
      ),
    );
  }
}
