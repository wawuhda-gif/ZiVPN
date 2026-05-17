import 'package:flutter/material.dart';
import '../../core/services/vpn_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool connected = false;
  final vpn = VPNService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090014),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('MiniZiVPN'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                if (!connected) {
                  await vpn.connect();
                } else {
                  await vpn.disconnect();
                }

                setState(() {
                  connected = !connected;
                });
              },
              child: Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: connected
                        ? Colors.greenAccent
                        : Colors.purpleAccent,
                    width: 4,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: connected
                          ? Colors.greenAccent
                          : Colors.purpleAccent,
                      blurRadius: 30,
                      spreadRadius: 4,
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    connected ? 'CONNECTED' : 'CONNECT',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              connected
                  ? 'VPN Tunnel Active'
                  : 'Disconnected',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
