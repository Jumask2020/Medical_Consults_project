import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/constant/app_color.dart';
import 'package:medical_consult_project/core/view/screen/consults/chatting_view.dart';
import 'package:medical_consult_project/core/view/screen/consults/new_consults_view.dart';
import 'package:medical_consult_project/core/view/screen/profile/display_profile_view.dart';
import 'package:medical_consult_project/core/view/widget/my_circular_contanier.dart';
import 'package:medical_consult_project/core/view/widget/my_container.dart';
import 'package:medical_consult_project/core/view/widget/my_horizntal_size.dart';
import 'package:medical_consult_project/core/view/widget/my_vertical_size.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Switch(
              value: true,
              // focusColor: Colors.blue,
              // hoverColor: Colors.blueAccent,
              activeColor: const Color.fromARGB(255, 209, 255, 211),
              onChanged: (value) {})
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 3,
                    child: MyContainer(
                      margin: EdgeInsets.only(top: 50, left: 40),
                      topRight: 30,
                      topLeft: 30,
                      color: const Color.fromARGB(255, 35, 201, 110),
                      height: 200,
                      width: MediaQuery.of(context).size.width,
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
                      right: 90,
                      child: Column(
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
                            "د.جمعان عسكول",
                            style: TextStyle(
                                fontFamily: 'LBC',
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      )),
                  Positioned(
                    top: 250,
                    child: Text(
                      "ملخص العمليات",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'LBC',
                          fontSize: 20),
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
                    //color: Colors.transparent,
                    child: MyContainer(
                      topRight: 50,
                      color: Colors.greenAccent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("5"), Icon(Icons.timer_outlined)],
                      ),
                    ),
                  ),
                  Card(
                    child: MyContainer(
                      topLeft: 50,
                      color: Colors.cyan,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("5"), Icon(Icons.done_all_outlined)],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    child: MyContainer(
                      bottomRight: 50,
                      color: Colors.cyan,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("5"), Icon(Icons.star)],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    child: MyContainer(
                      bottomLeft: 50,
                      color: Colors.greenAccent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("5"), Icon(Icons.question_answer)],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // onTap: _onItemTapped,
        backgroundColor: AppColor.secondaryColor,
        unselectedItemColor: AppColor.primaryColor,
        selectedItemColor: Colors.purple,
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
