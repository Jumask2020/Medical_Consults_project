import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/constant/app_color.dart';
import 'package:medical_consult_project/core/view/widget/my_messageBubbles.dart';
import 'package:medical_consult_project/core/view/widget/my_text_form_field.dart';
import 'package:medical_consult_project/core/global/components/isPdfFile.dart';
import 'package:provider/provider.dart';
import '../../../global/components/isImageFile.dart';
import '../../../view_model/replay_v_m.dart';
import '../../widget/show_loading.dart';

class Chatting extends StatefulWidget {
  const Chatting({super.key, required this.id});
  final String id;

  @override
  _ChattingState createState() => _ChattingState();
}

class _ChattingState extends State<Chatting> {
  final TextEditingController message = TextEditingController();
  final ReplayVM _replayVM = ReplayVM();

  File? file;
  String? fileName;
  bool isImage = false;
  bool isPDF = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReplayVM>(
      create: (ctx) => ReplayVM(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Chat', style: TextStyle(color: Colors.white)),
            backgroundColor: AppColor.primaryColor,
            elevation: 0,
          ),
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
                      future: _replayVM.getReplies(widget.id),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const ShowLoading();
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('تأكد من اتصالك بالانترنت'));
                        } else if (snapshot.data!.isEmpty) {
                          return Center(
                            child: Text(
                              'لاتوجد رسائل',
                              style: TextStyle(fontSize: 20),
                            ),
                          );
                          ;
                        }
                        return ListView.builder(
                          reverse: true,
                          itemCount: snapshot.data?.length,
                          itemBuilder: (BuildContext context, int index) {
                            var messageData = snapshot
                                .data![snapshot.data!.length - 1 - index];
                            bool isMe = true;

                            return Align(
                              alignment: isMe
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 8.0),
                                child: Column(
                                  crossAxisAlignment: isMe
                                      ? CrossAxisAlignment.start
                                      : CrossAxisAlignment.start,
                                  children: [
                                    if (messageData.file != null &&
                                        isImageFile(messageData.file))
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, '/imageView',
                                                  arguments: messageData.file);
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 15),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5),
                                              width: 200,
                                              height: 200,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                      color:
                                                          AppColor.primaryColor,
                                                      width: 5)),
                                              child: Image.network(
                                                messageData.file!,
                                                // width: 150,
                                                // height: 150,

                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          MessageBubble(
                                            message: messageData.message!,
                                            isMe: isMe,
                                          ),
                                        ],
                                      )
                                    else if (messageData.file != null &&
                                        isPdfFile(messageData.file))
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, '/pdfView',
                                              arguments: messageData.file);
                                        },
                                        child: Row(
                                          children: [
                                            const Icon(Icons.picture_as_pdf,
                                                color: Colors.red),
                                            const SizedBox(width: 8),
                                            Expanded(
                                              child: Text(
                                                messageData.file
                                                        ?.split('/')
                                                        .last ??
                                                    'PDF File',
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      MessageBubble(
                                        message: messageData.message!,
                                        isMe: isMe,
                                      ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                }),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (file != null)
                        Container(
                          margin: const EdgeInsets.only(bottom: 8.0),
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (isImage)
                                Image.file(
                                  file!,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                )
                              else if (isPDF)
                                const Icon(Icons.picture_as_pdf,
                                    color: Colors.red),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  fileName ?? 'Selected File',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.cancel, color: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    file = null;
                                    fileName = null;
                                    isImage = false;
                                    isPDF = false;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      Row(
                        children: [
                          Expanded(
                            flex: 9,
                            child: Consumer<ReplayVM>(
                              builder: (context, r, child) {
                                return MyTextFormField(
                                  controller: message,
                                  hintText: "اكتب الرد هنا.....",
                                  // File picker button
                                  prefixIcon: IconButton(
                                    icon: const Icon(Icons.attach_file,
                                        color: Colors.teal),
                                    onPressed: () async {
                                      FilePickerResult? result =
                                          await FilePicker.platform.pickFiles();
                                      if (result != null) {
                                        setState(() {
                                          file =
                                              File(result.files.single.path!);
                                          fileName = result.files.single.name;
                                          isImage = isImageFile(fileName);
                                          isPDF = isPdfFile(fileName);
                                        });
                                      }
                                    },
                                  ),
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.send,
                                        color: Colors.teal),
                                    onPressed: () async {
                                      if (message.text.isNotEmpty ||
                                          file != null) {
                                        await _replayVM.addReply(
                                          id: widget.id,
                                          message: message.text.isEmpty
                                              ? 'ملف مرفق'
                                              :
                                          message.text,
                                          filePath: file,
                                        );
                                        _replayVM.sendMessage();

                                        setState(() {
                                          message.clear();
                                          file = null;
                                          fileName = null;
                                          isImage = false;
                                          isPDF = false;
                                        });
                                      }
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
