import 'package:flutter/services.dart';

class VPNService {

  static const platform = MethodChannel('zivpn/vpn');

  Future<void> connect() async {

    try {

      await platform.invokeMethod("startVPN");

    } catch (e) {

      print("VPN START ERROR: $e");
    }
  }

  Future<void> disconnect() async {

    try {

      await platform.invokeMethod("stopVPN");

    } catch (e) {

      print("VPN STOP ERROR: $e");
    }
  }
}
