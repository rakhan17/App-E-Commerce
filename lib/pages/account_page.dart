// lib/pages/account_page.dart

import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  final String email;

  const AccountPage({super.key, required this.email});

  // Reusable function untuk membuat item menu
  Widget _buildSettingItem(
      BuildContext context, {
        required IconData icon,
        required String title,
        required VoidCallback onTap,
      }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.white70),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        trailing: const Icon(Icons.chevron_right, color: Colors.white70),
        onTap: onTap,
      ),
    );
  }

  // Fungsi untuk menampilkan dialog konfirmasi logout
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade900,
          title: const Text('Konfirmasi Logout', style: TextStyle(color: Colors.white)),
          content: const Text('Apakah Anda yakin ingin keluar?', style: TextStyle(color: Colors.white70)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal', style: TextStyle(color: Colors.white70)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('OK', style: TextStyle(color: Colors.redAccent)),
              onPressed: () {
                // 1. Tutup dialog
                Navigator.of(context).pop();

                // 2. Langsung arahkan ke halaman login
                Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final String name = "Primus Shop"; // Ganti dengan nama Anda
    final String userEmail = email; // Menggunakan email dari login

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        children: [
          // 1. Header Profil
          _buildProfileHeader(context, name, userEmail),
          
          // 2. List Menu Settings
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // PENAMBAHAN TOMBOL NAVIGASI KE CART
                _buildSettingItem(
                  context,
                  icon: Icons.shopping_cart_outlined,
                  title: 'My Cart',
                  onTap: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                ),
                _buildSettingItem(
                  context,
                  icon: Icons.person_outline,
                  title: 'Profile',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/edit_profile',
                      arguments: {'name': name, 'email': userEmail},
                    );
                  },
                ),
                _buildSettingItem(
                  context,
                  icon: Icons.lock_outline,
                  title: 'Change Password',
                  onTap: () {
                    Navigator.pushNamed(context, '/change_password');
                  },
                ),
                _buildSettingItem(
                  context,
                  icon: Icons.notifications_outlined,
                  title: 'Notifications',
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Fitur Notifikasi akan segera hadir!')),
                    );
                  },
                ),
                _buildSettingItem(
                  context,
                  icon: Icons.help_outline,
                  title: 'Help & Support',
                  onTap: () {
                     ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Pusat Bantuan akan segera hadir!')),
                    );
                  },
                ),
                const SizedBox(height: 20),
                _buildSettingItem(
                  context,
                  icon: Icons.logout,
                  title: 'Logout',
                  onTap: () {
                    _showLogoutDialog(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk Header Profil
  Widget _buildProfileHeader(BuildContext context, String name, String email) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey.shade900, Colors.black],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        )
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 54, // Radius luar sebagai border
            backgroundColor: Colors.white,
            child: const CircleAvatar(
              radius: 50, // Radius dalam untuk gambar
              backgroundImage: AssetImage('assets/PS.png'), // Ganti dengan path gambar profil Anda
              backgroundColor: Colors.grey, // Warna fallback jika gambar tidak ada
            ),
          ),
          const SizedBox(height: 16),
          Text(
            name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            email,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}
