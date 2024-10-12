import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NetworkServiceHelper extends ChangeNotifier {
  StreamController controller = StreamController();

  NetworkServiceHelper() {
    Connectivity().onConnectivityChanged.listen((event) {
      controller.add(_networkStatus(event as ConnectivityResult));
    });
  }
  NetworkStatus _networkStatus(ConnectivityResult result) {
    return result == ConnectivityResult.mobile ||
            result == ConnectivityResult.wifi
        ? NetworkStatus.online
        : NetworkStatus.offline;
  }
}

enum NetworkStatus { online, offline }
