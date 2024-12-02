import 'package:flutter/material.dart';
import 'dashboard_page.dart'; // Import the Dashboard Page

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Header Section
            const Text(
              'Elevate Your Workout!',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Package Section
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: const [
                  PackageCard(name: 'Basic Plan', price: '\$25'),
                  PackageCard(name: 'Pro Plan', price: '\$55'),
                  PackageCard(name: 'Advanced Plan', price: '\$75'),
                  PackageCard(name: 'Premium Plan', price: '\$100'),
                ],
              ),
            ),

            // Navigation Button
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Dashboard Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DashboardPage()),
                );
              },
              child: const Text('Go to Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}

class PackageCard extends StatelessWidget {
  final String name;
  final String price;

  const PackageCard({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[800],
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: const TextStyle(fontSize: 18, color: Colors.white)),
            Text(price, style: const TextStyle(fontSize: 16, color: Colors.white70)),
          ],
        ),
      ),
    );
  }
}
