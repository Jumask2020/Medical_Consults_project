
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/view/widget/my_messageBubbles.dart';
import 'package:medical_consult_project/core/view/widget/my_text_form_field.dart';
import 'package:medical_consult_project/core/view_model/replay_v_m.dart';
import 'package:provider/provider.dart';
import '../../widget/show_loading.dart';

class Chatting extends StatelessWidget {
  Chatting({super.key,required this.id});
  String id;

  TextEditingController message = TextEditingController();

  ReplayVM _replayVM= ReplayVM();

  String? Me;
  File? file;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReplayVM>(
      create: (ctx) => ReplayVM(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Consumer<ReplayVM>(builder: (ctx, r, child) {
                    return Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      bottom: 100,
                      child: FutureBuilder(
                        future: _replayVM.getReplies(id),
                        builder:(context, snapshot) {
                          if(snapshot.connectionState == ConnectionState.waiting){
                            return const ShowLoading();
                          }
                          if(snapshot.hasError){
                            return Text('no interNet');
                          }
                          return ListView.builder(
                              reverse: true,
                              itemCount: snapshot.data?.length,
                              itemBuilder: (BuildContext context, int index) {
                                return MessageBubble(
                                  message: snapshot.data![snapshot.data!
                                      .length - 1 - index].message!,
                                  isMe: true,
                                );
                              }
                          );

                        }),
                    );
                  }),

                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 9,
                          child: Consumer<ReplayVM>(
                            builder: (context,r,child) {
                              return MyTextFormField(
                                  controller: message,
                                  hintText: ".....اكتب الرد هنا",
                                  suffixIcon: Consumer<ReplayVM>(
                                    builder: (ctx, obj, child) => IconButton(
                                        onPressed: () {
                                            r.requestMessage = message.text;
                                            r.sendMessage();
                                            _replayVM.addReply(message: message.text,id: id,);
                                            message.clear();
                                        },
                                        icon: Icon(Icons.send)),
                                  ));
                            }
                          ),
                        ),
                        // Expanded(
                        //     child:
                        //         IconButton(onPressed: () {}, icon: Icon(Icons.send))),
                        Expanded(
                            child: IconButton(
                                onPressed: () async{
                                  FilePickerResult? result = await FilePicker.platform.pickFiles();
                                  if (result != null) {
                                    file = File(result.files.single.path!);
                                    print(file!.path);
                                    await _replayVM.addReply(id: id,filePath: file,message: 'askool');
                                    _replayVM.sendMessage();
                                    print('----------');
                                  } else {
                                    // User canceled the picker
                                  }
                                },
                                icon: Icon(Icons.insert_comment))),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}