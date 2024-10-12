import 'package:flutter/material.dart';
import 'package:medical_consult_project/helper/network_service_helper.dart';
import 'package:provider/provider.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    // var netWorkStatus = Provider.of<NetworkStatus>(context);
    return const Scaffold(
      body: Center(
        child: NetworkStatus == NetworkStatus.online
            ? Text('InterNet')
            : Text('Not InterNet'),
      ),
    );
  }
}
