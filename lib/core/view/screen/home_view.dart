import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/constant/app_color.dart';
import 'package:medical_consult_project/core/view/screen/dashboard_view.dart';
import 'package:medical_consult_project/core/view/screen/consults/chatting_view.dart';
import 'package:medical_consult_project/core/view/screen/consults/new_consults_view.dart';
import 'package:medical_consult_project/core/view/screen/profile/display_profile_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> page = [
    NewConsults(),

    DashBoardView(),
    DisplayProfileView(),

  ];
  int indexPage = 0;
  void selectPage(int index) {
    setState(() {
      indexPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColor.secondaryColor,
      body: page[indexPage],
      bottomNavigationBar: BottomAppBar(
        // color: Colors.teal,
        shape:CircularNotchedRectangle() ,
        notchMargin: 3,
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        child: Container(
          // height: kBottomNavigationBarHeight * 0.98,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                top: BorderSide(
                  color: AppColor.secondaryColor,
                  width: 0.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
              onTap: selectPage,
              backgroundColor: AppColor.primaryColor,
              unselectedItemColor: AppColor.secondaryColor,
              selectedItemColor: Colors.black,

              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: 1,
              items:const [
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
          ),
        ),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(4.0),
        child: FloatingActionButton(
          hoverElevation: 10,
          splashColor: Colors.grey,
          tooltip: 'Home',
          elevation: 5,
          child: Icon(Icons.home),
          onPressed: ()  => setState(() {
            indexPage = 1;
          }),

        ),
      ),
    );
  }
}
