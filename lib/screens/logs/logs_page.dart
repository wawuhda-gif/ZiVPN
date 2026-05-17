import 'package:flutter/material.dart';

class LogsPage extends StatelessWidget {
  const LogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090014),
      appBar: AppBar(
        title: const Text('Live Logs'),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text(
            '[INFO] VPN Service Started',
            style: TextStyle(color: Colors.greenAccent),
          ),
          SizedBox(height: 10),
          Text(
            '[INFO] UDP Tunnel Connected',
            style: TextStyle(color: Colors.cyanAccent),
          ),
          SizedBox(height: 10),
          Text(
            '[INFO] Waiting Network Response...',
            style: TextStyle(color: Colors.orangeAccent),
          )
        ],
      ),
    );
  }
}
