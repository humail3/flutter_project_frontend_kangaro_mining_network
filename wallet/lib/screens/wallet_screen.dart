import 'package:flutter/material.dart';
import 'package:wallet/screens/wallet_screens/coin_details_screen.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  double balance=0.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Wallet',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.visibility_off, color: Colors.black),
            onPressed: () {
              // Toggle visibility
            },
          ),
          IconButton(
            icon: Icon(Icons.add, color: Colors.black),
            onPressed: () {
              // Add functionality
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildBalanceSection(),
          _buildTokenList(),
        ],
      ),
    );
  }

  Widget _buildBalanceSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Wallet 1',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Center(
            child: Column(
              children: [
                Text(
                  '\$'+'${balance.toString()}',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildNFTCard(),
        ],
      ),
    );
  }

  Widget _buildTokenList() {
    return Expanded(
      child: ListView(
        children: [
          _buildTokenTile(
              'Kngro', '\$0.017914', '-0.92%', 'assets/kngro.png', context, 'KngroAddressHere'),
          _buildTokenTile(
              'BTC', '0.00', '0.00 USD', 'assets/btc.png', context, 'BTCAddressHere'),
          _buildTokenTile(
              'ETH', '0.00', '0.00 USD', 'assets/eth.png', context, 'ETHAddressHere'),
          _buildTokenTile(
              'DOGE', '0.00', '0.00 USD', 'assets/doge.png', context, 'DOGEAddressHere'),
          _buildTokenTile(
              'USDT', '0.00', '0.00 USD', 'assets/usdt.png', context, 'USDTAddressHere'),
          _buildTokenTile(
              'TRON', '0.00', '0.00 USD', 'assets/tron.png', context, 'TRONAddressHere'),
        ],
      ),
    );
  }

  Widget _buildNFTCard() {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Image.asset(
          'assets/nft.png', // Add your NFT icon
          width: 40,
          height: 40,
        ),
        title: const Text('NFT'),
        subtitle: const Text('Non-Fungible Token'),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
        onTap: () {
          // Handle NFT card click
        },
      ),
    );
  }

  Widget _buildTokenTile(String name, String price, String change,
      String assetPath, BuildContext context, String receivingAddress) {
    return ListTile(
      leading: Image.asset(
        assetPath,
        width: 40,
        height: 40,
      ),
      title: Text(name),
      subtitle: Row(
        children: [
          Text(price),
          const SizedBox(width: 8),
          Text(change, style: TextStyle(color: Colors.red)),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CoinDetailScreen(
              name: name,
              price: price,
              receivingAddress: '0x5f1cb2c57a99b2cf202555cf5be4444a276836b6',
              initialBalance: balance,
            ),
          ),
        );
      },
    );
  }
}
