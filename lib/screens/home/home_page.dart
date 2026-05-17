import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090014),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('MiniZiVPN'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.purpleAccent,
                  width: 4,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.purpleAccent,
                    blurRadius: 30,
                    spreadRadius: 4,
                  )
                ],
              ),
              child: const Center(
                child: Text(
                  'CONNECT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Column(
                  children: [
                    Text('DOWNLOAD', style: TextStyle(color: Colors.white70)),
                    SizedBox(height: 8),
                    Text('0 KB/s', style: TextStyle(color: Colors.white)),
                  ],
                ),
                Column(
                  children: [
                    Text('UPLOAD', style: TextStyle(color: Colors.white70)),
                    SizedBox(height: 8),
                    Text('0 KB/s', style: TextStyle(color: Colors.white)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
