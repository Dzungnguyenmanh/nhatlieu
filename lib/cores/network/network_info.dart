import 'package:connectivity_plus/connectivity_plus.dart';

abstract class INetworkInfo {
  Future<bool> isConnected();
  Future<ConnectivityResult> get connectivityResult;
  Stream<ConnectivityResult> get onConnectivityCHanged;
}

class NetworkInfo implements INetworkInfo {
  Connectivity _connectivity;
  factory NetworkInfo() {
    return _networkInfo;
  }
  static final NetworkInfo _networkInfo = NetworkInfo._internal(Connectivity());
  NetworkInfo._internal(this._connectivity);

  @override
  Future<bool> isConnected() async {
    final result = await _connectivity.checkConnectivity();
    var flg = false;
    if (result != ConnectivityResult.none) {
      flg = true;
    }
    return flg;
  }

  @override
  Future<ConnectivityResult> get connectivityResult async {
    return _connectivity.checkConnectivity();
  }

  @override
  Stream<ConnectivityResult> get onConnectivityCHanged =>
      _connectivity.onConnectivityChanged;
}
