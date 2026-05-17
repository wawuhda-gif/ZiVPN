import 'package:flutter/services.dart';

class VPNService {
  static const platform = MethodChannel('minizivpn/vpn');

  Future<void> connect() async {
    try {
      await platform.invokeMethod('connectVPN');
    } catch (e) {
      print('VPN connect error: $e');
    }
  }

  Future<void> disconnect() async {
    try {
      await platform.invokeMethod('disconnectVPN');
    } catch (e) {
      print('VPN disconnect error: $e');
    }
  }
}
