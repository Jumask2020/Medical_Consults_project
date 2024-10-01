import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/view/widget/my_container.dart';
import 'package:medical_consult_project/core/view/widget/my_messageBubbles.dart';

class Chatting extends StatelessWidget {
  const Chatting({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          appBar: AppBar(),
          
          body:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                MessageBubble(
                  message: 'مرحبا انا الطبيب',
                  isMe: true,
                ),
                MessageBubble(
                  message: 'مرحبا أنا المريض',
                  isMe: false,
                ),
                // Add more MessageBubbles here
              ],
            ),
          ),
        ),
        ) ;

  }
}
