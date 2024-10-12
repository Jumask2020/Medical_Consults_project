import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/view_model/consult_v_m.dart';

import '../../../constant/app_color.dart';

class NewConsults extends StatelessWidget {
  NewConsults({super.key});

  final ConsultVM _consultVM = ConsultVM();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          title: Text(
            'الاستشارات الجديدة',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: _consultVM.fetchAllConsult(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            var consult = snapshot.data;

            return ListView.builder(
              itemCount: consult?.length ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.secondaryColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, "/consultDetails", arguments: consult[index]);
                      },
                      title: Text(
                        consult![index].title!,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        consult[index].description!,
                        style: TextStyle(fontSize: 16, color: AppColor.primaryColor,),
                      ),
                      leading: ClipRRect(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          "assets/images/logo.jpg",
                          // color: AppColor.primaryColor,
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/chatting");
                        },
                        icon: Icon(
                          Icons.messenger,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
