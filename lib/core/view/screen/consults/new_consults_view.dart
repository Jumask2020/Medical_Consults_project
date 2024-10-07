import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/view_model/consult_v_m.dart';

class NewConsults extends StatelessWidget {
   NewConsults({super.key});

   ConsultVM _consultVM = ConsultVM();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: FutureBuilder(
            future: _consultVM.fetchAllConsult(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
              }
             // var consult = snapshot.data;
             //  print(consult);
             return ListView.builder(

                  itemCount: snapshot.data!.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      onTap: (){
                        Navigator.pushNamed(context, "/consultDetails");
                      },
                      title: Text("عنوان الإستشارة"),
                      subtitle: Text("وصف الإستشارة"),
                      leading:Image.asset("assets/images/logo.jpg") ,
                      trailing: IconButton(onPressed: (){
                        Navigator.pushNamed(context, "/chatting");

                      },icon: Icon(Icons.messenger,),),
                    );
                  }
              );
            }
          )
        ),
    );
  }
}
