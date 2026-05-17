import 'package:flutter/material.dart';

class ServersPage extends StatelessWidget {
  const ServersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090014),
      appBar: AppBar(
        title: const Text('Server Manager'),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          serverCard('Singapore UDP', 'online'),
          serverCard('Indonesia SSH', 'online'),
          serverCard('Japan Xray', 'maintenance'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purpleAccent,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget serverCard(String name, String status) {
    return Card(
      color: const Color(0xFF170B2D),
      child: ListTile(
        leading: const Icon(Icons.dns, color: Colors.purpleAccent),
        title: Text(name, style: const TextStyle(color: Colors.white)),
        subtitle: Text(status, style: const TextStyle(color: Colors.white70)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white54),
      ),
    );
  }
}
