import 'dart:ffi';

import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: () {}),
      appBar: AppBar(),
      body: const SizedBox(
        width: double.infinity,
        // child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        child: Text('بلاتنمكمكمككككككك'),
        //     Container(
        //       height: 30,
        //       width: 30,
        //       color: Colors.amber,
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
