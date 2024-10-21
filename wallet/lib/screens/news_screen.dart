import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'News',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row of Crypto Icons
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CryptoIcon(
                    assetPath: 'assets/btc.png',
                    label: 'BTC',
                    selected: true,
                  ),
                  SizedBox(width: 8.0),
                  CryptoIcon(
                    assetPath: 'assets/eth.png',
                    label: 'ETH',
                  ),                  SizedBox(width: 8.0),

                  CryptoIcon(
                    assetPath: 'assets/doge.png',
                    label: 'DOGE',
                  ),                  SizedBox(width: 8.0),
                  CryptoIcon(
                    assetPath: 'assets/kngro.png',
                    label: 'KNGRO',
                  ),                  SizedBox(width: 8.0),

                  CryptoIcon(
                    assetPath: 'assets/usdt.png',
                    label: 'USDT',
                  ),                  SizedBox(width: 8.0),

                  CryptoIcon(
                    assetPath: 'assets/tron.png',
                    label: 'TRON',
                  ),                  SizedBox(width: 8.0),

                ],
              ),
            ),
            SizedBox(height: 24),

            // Featured Section
            Text(
              'Featured',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.yellow, width: 1),
              ),
            ),
            SizedBox(height: 24),

            // Crypto News Section
            Text(
              'Crypto News',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Oct 07, 2021'),
                Chip(
                  label: Text('btc, blockchain'),
                  backgroundColor: Colors.yellow,
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.yellow, width: 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CryptoIcon extends StatelessWidget {
  final String assetPath;
  final String label;
  final bool selected;

  const CryptoIcon({
    Key? key,
    required this.assetPath,
    required this.label,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(
              color: selected ? Colors.yellow : Colors.transparent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset(
            assetPath,
            height: 40,
            width: 40,
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: selected ? Colors.black : Colors.grey,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

