import 'package:flutter/material.dart';

class DexScreen extends StatefulWidget {
  const DexScreen({super.key});

  @override
  State<DexScreen> createState() => _DexScreenState();
}

class _DexScreenState extends State<DexScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back navigation
          },
        ),
        title: const Text(
          'Choose Exchange',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select if you like to choose Cross-Chain Dex or CryptoKara Dex',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            _buildDexOption(
              context,
              title: 'Cross Chain Dex',
              icon: Icons.swap_horiz,
              onTap: () {
                // Navigate to Cross Chain Dex screen
              },
            ),
            const SizedBox(height: 16),
            _buildDexOption(
              context,
              title: 'CryptoKara Bsc Dex',
              icon: Icons.swap_vert,
              onTap: () {
                // Navigate to CryptoKara Bsc Dex screen
              },
            ),
          ],
        ),
      ),
    );
  }
}


  Widget _buildDexOption(BuildContext context, {required String title, required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.yellow.shade700,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 30),
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
