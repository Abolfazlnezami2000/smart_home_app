import 'package:connectivity/connectivity.dart';
import 'package:esptouch_smartconfig/esptouch_smartconfig.dart';
import 'package:get/get.dart';

enum Status { error, noWifi, hasData, none }

class WifiData {
  final String wifiName;
  final String bssid;
  final String ip;
  final String password;

  WifiData(
      {required this.wifiName,
      required this.bssid,
      required this.ip,
      required this.password});
}

class GiveWifiDataController extends GetxController {
  Rx<Status> status = Status.none.obs;
  WifiData wifiData = WifiData(wifiName: '', ip: '', password: '', bssid: '');

  void getWifiData() async {
    try {
      //TODO: Will be change
      await Future.delayed(Duration(seconds: 3));
      Connectivity _connectivity = Connectivity();
      var _networkStatus = await _connectivity.checkConnectivity();
      if (_networkStatus == ConnectivityResult.wifi) {
        Map<String, String>? data = await EsptouchSmartconfig.wifiData();
        if(data != null){
          wifiData = WifiData(
              wifiName: data['wifiName'] ?? "",
              ip: data['ip'] ?? "",
              password: "",
              bssid: data['bssid'] ?? "");
          status.value = Status.hasData;
        }
      } else if (_networkStatus == ConnectivityResult.mobile) {
        status.value = Status.noWifi;
      } else {
        status.value = Status.error;
      }
    } catch (e) {
      status.value = Status.error;
    }
  }
}
