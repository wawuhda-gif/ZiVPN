import 'package:flutter/material.dart';

void main() {
  runApp(const MiniZiVPN());
}

class MiniZiVPN extends StatelessWidget {
  const MiniZiVPN({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MiniZiVPN',
      theme: ThemeData.dark(),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    DashboardPage(),
    ServersPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: const Color(0xFF12001F),
        selectedItemColor: Colors.purpleAccent,
        unselectedItemColor: Colors.white54,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dns),
            label: 'Servers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool connected = false;

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
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF170B2D),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: const [
                  Icon(Icons.shield, color: Colors.purpleAccent, size: 40),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tunnel Protected',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Cyber Secure VPN',
                        style: TextStyle(color: Colors.white70),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                setState(() {
                  connected = !connected;
                });
              },
              child: Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: connected
                        ? [Colors.greenAccent, Colors.green]
                        : [Colors.purpleAccent, Colors.pinkAccent],
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
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                statCard('Download', '0 KB/s'),
                statCard('Upload', '0 KB/s'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget statCard(String title, String value) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF170B2D),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 10),
          Text(value,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}

class ServersPage extends StatelessWidget {
  const ServersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090014),
      appBar: AppBar(
        title: const Text('Servers'),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          serverCard('Singapore Server', 'Online'),
          serverCard('Indonesia Server', 'Online'),
          serverCard('Japan Server', 'Maintenance'),
        ],
      ),
    );
  }

  Widget serverCard(String name, String status) {
    return Card(
      color: const Color(0xFF170B2D),
      child: ListTile(
        leading: const Icon(Icons.cloud, color: Colors.purpleAccent),
        title: Text(name, style: const TextStyle(color: Colors.white)),
        subtitle: Text(status, style: const TextStyle(color: Colors.white70)),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090014),
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          settingTile(Icons.security, 'VPN Protection'),
          settingTile(Icons.speed, 'Connection Speed'),
          settingTile(Icons.language, 'DNS Settings'),
          settingTile(Icons.info, 'About Application'),
        ],
      ),
    );
  }

  Widget settingTile(IconData icon, String title) {
    return Card(
      color: const Color(0xFF170B2D),
      child: ListTile(
        leading: Icon(icon, color: Colors.purpleAccent),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        trailing: const Icon(Icons.arrow_forward_ios,
            color: Colors.white54),
      ),
    );
  }
}
