import 'dart:async';

class TrafficMonitorService {
  int downloadSpeed = 0;
  int uploadSpeed = 0;

  void startMonitoring() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      downloadSpeed += 10;
      uploadSpeed += 5;

      print('RX: \$downloadSpeed KB/s');
      print('TX: \$uploadSpeed KB/s');
    });
  }
}
