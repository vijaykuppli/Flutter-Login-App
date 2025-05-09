import 'package:flutter/material.dart';

class TabProfileScreen extends StatefulWidget {
  const TabProfileScreen({super.key});

  @override
  State<TabProfileScreen> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<TabProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                'assets/profile_icon.png',
              ), // Replace with your image asset
            ),
            const SizedBox(height: 16),
            const Text(
              "Vijay Santosh",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "vijay.kuppli@robosoftin.com",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text("Phone"),
              subtitle: const Text("+1 234 567 890"),
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text("Address"),
              subtitle: const Text("123 Main Street, City, Country"),
            ),
          ],
        ),
      ),
    );
  }
}
