import 'package:kuis_mobile_124240156/screens/login_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String username;

  const ProfileScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.purple.shade50,
            child: const Icon(Icons.person, size: 45, color: Colors.purple),
          ),
          const SizedBox(height: 12),
          const Text(
            "Username",
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
          const SizedBox(height: 4),
          Text(
            username,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              side: BorderSide(color: Colors.purple.shade200),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout, size: 18, color: Colors.purple),
            label: const Text("Logout", style: TextStyle(color: Colors.purple)),
          ),
        ],
      ),
    );
  }
}
