import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewConsults extends StatelessWidget {
  const NewConsults({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: ListView.builder(

            itemCount: 3,
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
          )
        ),
    );
  }
}
