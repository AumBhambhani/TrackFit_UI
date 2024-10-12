import 'package:flutter/material.dart';

void main() {
  runApp(TrackFitApp());
}

class TrackFitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('TrackFit'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Elevate Your Workout!',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Get Started'),
                    ),
                  ],
                ),
              ),

              // Package Section
              Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Our Packages', style: TextStyle(fontSize: 22)),
                    SizedBox(height: 20),
                    PackageCard(name: 'Basic Plan', price: '\$25'),
                    PackageCard(name: 'Pro Plan', price: '\$55'),
                    PackageCard(name: 'Advanced Plan', price: '\$75'),
                    PackageCard(name: 'Premium Plan', price: '\$100'),
                  ],
                ),
              ),

              // Footer Section
              Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Subscribe to our fitness tips!',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PackageCard extends StatelessWidget {
  final String name;
  final String price;

  PackageCard({required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: TextStyle(fontSize: 18, color: Colors.white)),
          Text(price, style: TextStyle(fontSize: 16, color: Colors.white70)),
        ],
      ),
    );
  }
}
