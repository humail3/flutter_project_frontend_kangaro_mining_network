import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          // Settings section
          _buildSettingsSection('Settings', [
            _buildListTile(Icons.language, 'Choose Language', onTap: () {}),
            _buildListTile(Icons.attach_money, 'Choose Currency', onTap: () {}),
          ]),
          // Social section
          _buildSettingsSection('Social', [
            _buildListTile(Icons.share, 'Share App', onTap: () {}),
            _buildListTile(Icons.telegram, 'Telegram', onTap: () {}),
            _buildListTile(Ionicons.logo_instagram, 'Instagram', onTap: () {}),
            _buildListTile(Ionicons.logo_twitter, 'Twitter', onTap: () {}),
            _buildListTile(Icons.article, 'Medium', onTap: () {}),
            _buildListTile(Icons.facebook, 'Facebook', onTap: () {}),
            _buildListTile(Icons.support, 'Support', onTap: () {}),
          ]),
          // Wallet section
          _buildSettingsSection('Wallet', [
            _buildListTile(Icons.wallet, 'Wallets', onTap: () {}),
            _buildListTile(Icons.book, 'Address Book', onTap: () {}),
            _buildListTile(Icons.link, 'Wallet Connect', onTap: () {}),
            _buildSwitchListTile(Icons.memory, 'Testnet', false, (value) {}),
            _buildSwitchListTile(Icons.dark_mode, 'Dark Mode', false, (value) {}),
          ]),
          // Security section
          _buildSettingsSection('Security', [
            _buildListTile(Icons.lock, 'Security and Encryption', onTap: () {}),
            _buildListTile(Icons.backup, 'Backup Wallet', onTap: () {}),
            _buildListTile(Icons.key, 'Export Private Keys', onTap: () {}),
            _buildSwitchListTile(Icons.pin, 'Always Ask Pin', false, (value) {}),
          ]),
          // Delete wallet
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ListTile(
              leading: Icon(Icons.warning, color: Colors.red),
              title: Text(
                'Delete wallet',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                // Add delete wallet functionality
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...children,
      ],
    );
  }

  Widget _buildListTile(IconData icon, String title, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }

  Widget _buildSwitchListTile(IconData icon, String title, bool value, ValueChanged<bool> onChanged) {
    return SwitchListTile(
      secondary: Icon(icon),
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }

}
