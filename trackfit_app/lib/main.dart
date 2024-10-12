import 'dart:html' as html; // For webcam access
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
        body: ListView(
          padding: EdgeInsets.all(20.0),
          children: [
            // Header Section
            Text(
              'Elevate Your Workout!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text('Get Started'),
            ),

            // Package Section
            SizedBox(height: 20),
            Text('Our Packages', style: TextStyle(fontSize: 22)),
            SizedBox(height: 20),
            PackageCard(name: 'Basic Plan', price: '\$25'),
            PackageCard(name: 'Pro Plan', price: '\$55'),
            PackageCard(name: 'Advanced Plan', price: '\$75'),
            PackageCard(name: 'Premium Plan', price: '\$100'),

            // Footer Section
            SizedBox(height: 20),
            Text(
              'Subscribe to our fitness tips!',
              style: TextStyle(fontSize: 18),
            ),

            // Webcam Section
            SizedBox(height: 30), // Space before the webcam section
            ElevatedButton(
              onPressed: () {
                startWebcam(); // Start webcam stream on button press
              },
              child: Text('Start Webcam'),
            ),
            SizedBox(height: 20),
            Container(
              width: 640,
              height: 480,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
              ),
              child: HtmlElementView(viewType: 'videoElement'), // Embeds video stream
            ),
          ],
        ),
      ),
    );
  }

  // Method to start the webcam stream and assign it to the video element
  void startWebcam() {
    final html.VideoElement videoElement = html.VideoElement()
      ..width = 640
      ..height = 480
      ..autoplay = true;

    // Get the webcam stream
    html.window.navigator.mediaDevices?.getUserMedia({'video': true}).then((stream) {
      videoElement.srcObject = stream; // Assign webcam stream to video element
    });

    // Register the video element for HtmlElementView usage
    final videoWrapper = html.Element.div()..id = 'video-wrapper';
    videoWrapper.append(videoElement);

    // Attach to the body (or anywhere in the DOM)
    html.document.body?.append(videoWrapper);

    // Ensure Flutter knows about the viewType 'videoElement'
    html.document.getElementById('video-wrapper');
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
