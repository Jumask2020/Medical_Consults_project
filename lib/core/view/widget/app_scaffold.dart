import 'package:flutter/material.dart';
import 'package:medical_consult_project/helper/network_service_helper.dart';
import 'package:provider/provider.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    var netWorkStatus = Provider.of<NetworkStatus>(context);
    return Scaffold(
      body: netWorkStatus == NetworkStatus.online
          ? child
          : const Center(child: Text('No InterNet')),
    );
  }
}
