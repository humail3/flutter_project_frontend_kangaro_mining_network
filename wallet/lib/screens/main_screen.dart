import 'package:flutter/material.dart';
import 'package:wallet/screens/apps_screen.dart';
import 'package:wallet/screens/news_screen.dart';
import 'package:wallet/screens/settings_screen.dart';
import 'package:wallet/screens/wallet_screen.dart';

import 'dex_screen.dart';
import 'p2p_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 1; // Default to the "Wallet" screen

  final List<Widget> _screens = [
    // AppsScreen(),
    NewsScreen(),
    WalletScreen(),
    // DexScreen(),
    P2PScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.apps),
          //   label: 'DApps',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.swap_horiz),
          //   label: 'DEX',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: 'P2P',
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

// class DAppsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('DApps Screen'));
//   }
// }
//
// class NewsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('News Screen'));
//   }
// }
//
// class WalletScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('Wallet Screen'));
//   }
// }
//
// class DexScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('DEX Screen'));
//   }
// }
//
// class SettingsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('Settings Screen'));
//   }
// }
