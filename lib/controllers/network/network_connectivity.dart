import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../../views/pages/base_screen.dart';

class NetworkConnectivity {
  NetworkConnectivity.internal();
  static NetworkConnectivity instance = NetworkConnectivity.internal();
  NetworkConnectivity factory() {
    return instance;
  }

  final _networkConnectivity = Connectivity();
  final _controller = StreamController.broadcast();
  Stream get myStream => _controller.stream;
  void initialise() async {
    ConnectivityResult result = await _networkConnectivity.checkConnectivity();
    _checkStatus(result);
    _networkConnectivity.onConnectivityChanged.listen((result) {
      print(result);
      _checkStatus(result);
    });
  }

  void _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('example.com');
      isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isOnline = false;
    }
    _controller.sink.add({result: isOnline});
  }

  void disposeStream() => _controller.close();

  void connectionListener() {
    initialise();
    myStream.listen((source) {
      _source = source;
      log('source $_source');
      // 1.
      switch (_source.keys.toList()[0]) {
        case ConnectivityResult.mobile:
          network = _source.values.toList()[0] ? 'Online' : 'Offline';
          break;
        case ConnectivityResult.wifi:
          network = _source.values.toList()[0] ? 'Online' : 'Offline';
          break;
        case ConnectivityResult.none:
        default:
          network = 'Offline';
      }
    });
  }
}

Map _source = {ConnectivityResult.none: false};
final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;
String network = '';
