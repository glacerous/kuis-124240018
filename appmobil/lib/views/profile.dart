import 'package:flutter/material.dart';
import '../models/user.dart';
import '/views/login.dart';

class ProfilePage extends StatelessWidget {
  final String username; // Menerima data username dari Root

  const ProfilePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    // Cari data user lengkap berdasarkan username dari models/user.dart
    final user = users.firstWhere(
      (u) => u.username == username,
      orElse: () => User(username: username, password: '', name: 'Pengguna'),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 10),

            // 1. AVATAR ICON USER
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person,
                  size: 70,
                  color: Colors.teal,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 2. NAMA DAN USERNAME UTAMA
            Text(
              user.username,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              '“Saya bersumpah mengerjakan soal kuis ini dengan jujur dan tidak melakukan kecurangan apapun itu"',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),

            // 3. card
            // Container(
            //   padding: const EdgeInsets.all(16),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(12),
            //     border: Border.all(color: Colors.grey.shade200),
            //   ),
            //   child: Column(
            //     children: [
            //       _buildProfileRow(Icons.badge_outlined, 'Nama Lengkap', user.name),
            //       const Divider(height: 20),
            //       _buildProfileRow(Icons.account_circle_outlined, 'Username', user.username),
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 30),

            // logout
            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.logout),
                label: const Text('Logout', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade600,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget untuk satu baris info profil
  Widget _buildProfileRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.teal),
        const SizedBox(width: 12),
        Text(
          label,
          style: TextStyle(fontSize: 13, color: Colors.grey[600]),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
