import 'package:flutter/material.dart';
import 'package:kuis_praktpm/auth/login_page.dart';
import 'package:kuis_praktpm/pages/about_page.dart';
import 'package:kuis_praktpm/pages/order_page.dart';

class HomePage extends StatelessWidget {
  final String username;

  HomePage({super.key, required this.username});

  final List<Map<String, dynamic>> menuItems = [
    {"name": "Nasi Goreng", "price": 15000},
    {"name": "Mie Ayam", "price": 12000},
    {"name": "Sate Ayam", "price": 20000},
    {"name": "Bakso", "price": 10000},
    {"name": "Soto Ayam", "price": 18000},
    {"name": "Gado-Gado", "price": 13000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              _logout(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text("Selamat datang, $username!",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            TextButton(
              onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AboutPage();
              })),
              child: const Text("Klik untuk ke halaman About",
                  style: TextStyle(color: Colors.green)),
            ),
            const SizedBox(height: 10),
            // Title
            const Text(
              "Daftar Menu:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Menu
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: menuItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return _buildMenuItem(context, item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, Map<String, dynamic> item) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/piring.png', width: 100, height: 100),
          const SizedBox(height: 10),
          Text(item["name"],
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Text("Rp ${item["price"]}",
              style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderPage(
                    itemName: item["name"],
                    price: item["price"],
                  ),
                ),
              );
            },
            child: const Text("Pesan"),
          ),
        ],
      ),
    );
  }

  // Fungsi logout
  void _logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Apakah Anda yakin ingin logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}
