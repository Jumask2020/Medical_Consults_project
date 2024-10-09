import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/constant/app_color.dart';
import 'package:medical_consult_project/core/view/widget/my_container.dart';
import 'package:medical_consult_project/core/view/widget/my_horizntal_size.dart';
import 'package:medical_consult_project/core/view/widget/my_messageBubbles.dart';
import 'package:medical_consult_project/core/view/widget/my_text_form_field.dart';
import 'package:medical_consult_project/core/view_model/consult_v_m.dart';
import 'package:medical_consult_project/core/view_model/replay_v_m.dart';
import 'package:provider/provider.dart';

class Chatting extends StatelessWidget {
  ConsultVM consultVM = ConsultVM();
  ReplayVM replayvm = ReplayVM();
  TextEditingController message = TextEditingController();
  int itemCount = 1;
  String? Me;
  Chatting({super.key});

  @override
  Widget build(BuildContext context) {
    //debugPrint('4|THE MESSAGE${replayvm.requestMessage}');

    return ChangeNotifierProvider<ReplayVM>(
      create: (ctx) => ReplayVM(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Consumer<ReplayVM>(builder: (ctx, replayvmObj, child) {
                    return ListView.builder(
                      itemCount: itemCount,
                      itemBuilder: (BuildContext context, int index) {
                        // return Consumer<ReplayVM>(
                        //     builder: (ctx, replayvmObj, child) {
                        debugPrint('3|THE MESSAGE${replayvm.requestMessage}');
                        if (replayvm.requestMessage == "") {
                          debugPrint('4|THE MESSAGE${replayvm.requestMessage}');
                          return MessageBubble(
                            message: "${replayvmObj.requestMessage}",
                            isMe: true,
                          );
                        } else {
                          return MessageBubble(
                            message: "error",
                            isMe: true,
                          );
                        }
                        // });
                      },
                      // child: Column(
                      //   children: [
                      // Consumer<ReplayVM>(builder: (ctx, replayvmobj, child) {
                      //   debugPrint('3|THE MESSAGE${replayvm.requestMessage}');
                      //   if (replayvm.requestMessage == "") {
                      //     debugPrint('4|THE MESSAGE${replayvm.requestMessage}');
                      //     return MessageBubble(
                      //       message: "${replayvmobj.requestMessage.toString()}",
                      //       isMe: true,
                      //     );
                      //   } else {
                      //     return MessageBubble(
                      //       message: "${replayvmobj.requestMessage.toString()}",
                      //       isMe: true,
                      //     );
                      //   }
                      // }),
                      // Consumer<ReplayVM>(builder: (ctx, a, child) {
                      //   return Text("${a.count}");
                      // }),
                      // Consumer<ReplayVM>(builder: (ctx, obj, child) {
                      //   return FloatingActionButton(onPressed: () {
                      //     obj.count++;
                      //   });
                      // }),

                      // Icon(Icons.abc),
                      //   MessageBubble(
                      //     message: 'مرحبا أنا المريض',
                      //     isMe: false,
                      //   ),
                      // ],
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
                          child: MyTextFormField(
                              controller: message,
                              hintText: ".....اكتب الرد هنا",
                              suffixIcon: Consumer<ReplayVM>(
                                builder: (ctx, obj, child) => IconButton(
                                    onPressed: () {
                                      itemCount++;
                                      replayvm.replay.message = message.text;
                                      // Me=message.text;
                                      replayvm.changeMessage(message.text);

                                      replayvm.postRequest().then((x) {
                                        print(x);
                                        if (x != null) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "Send Successfully")));
                                          // obj.requestMessage =
                                          //     message.toString();
                                          message.text = "";
                                          // replayvm.replay.message.toString();
                                        }
                                      });
                                    },
                                    icon: Icon(Icons.send)),
                              )),
                        ),
                        // Expanded(
                        //     child:
                        //         IconButton(onPressed: () {}, icon: Icon(Icons.send))),
                        Expanded(
                            child: IconButton(
                                onPressed: () {},
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
