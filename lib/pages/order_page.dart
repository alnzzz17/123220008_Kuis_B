import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final String itemName;
  final int price;

  const OrderPage({super.key, required this.itemName, required this.price});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int quantity = 0;
  int totalPrice = 0;
  final TextEditingController _quantityController = TextEditingController();

  void _calculateTotal() {
    setState(() {
      quantity = int.tryParse(_quantityController.text) ?? 0;
      totalPrice = widget.price * quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Order"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Gambar
            Image.asset('assets/images/piring.png', width: 250, height: 150),
            const SizedBox(height: 20),

            // Nama & harga
            Text(widget.itemName,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text("Harga: Rp ${widget.price}",
                style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 20),

            // Input jumlah pesanan
            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Masukkan Jumlah",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Tombol submit
            ElevatedButton(
              onPressed:
                  _calculateTotal,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text("Submit"),
            ),
            const SizedBox(height: 20),

            // Total harga
            Text(
              "Total Harga: Rp $totalPrice",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
