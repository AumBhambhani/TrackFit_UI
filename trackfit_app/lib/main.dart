import 'dart:html' as html; // For webcam access
import 'dart:ui' as ui; // Import dart:ui for registerViewFactory
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart'; // For registering the viewType

void main() {
  runApp(TrackFitApp());
}

class TrackFitApp extends StatefulWidget {
  const TrackFitApp({super.key});

  @override
  _TrackFitAppState createState() => _TrackFitAppState();
}

class _TrackFitAppState extends State<TrackFitApp> {
  late VideoPlayerController _controller;
  double _loadingPercentage = 0.0; // To track loading percentage
  bool _webcamStarted = false; // Track webcam state

  @override
  void initState() {
    super.initState();
    // Initialize the video player controller with a local video file
    _controller = VideoPlayerController.asset('assets/videos/videoplayback.mp4') // Load video from assets
      ..initialize().then((_) {
        setState(() {
          _controller.setLooping(true); // Optional: Loop the video
        });
      });

    // Listener to track the loading percentage
    _controller.addListener(() {
      if (_controller.value.isBuffering) {
        // Calculate loading percentage
        final buffered = _controller.value.buffered;
        if (buffered.isNotEmpty) {
          final totalBuffered = buffered.last.end.inMilliseconds; // Total buffered time
          final duration = _controller.value.duration.inMilliseconds; // Total video duration
          setState(() {
            _loadingPercentage = (totalBuffered / duration) * 100; // Calculate percentage
          });
        }
      } else {
        // Reset loading percentage when not buffering
        setState(() {
          _loadingPercentage = 100.0; // Assume fully loaded if not buffering
        });
      }

      if (_controller.value.hasError) {
        print("Error: ${_controller.value.errorDescription}");
      }
    });

    // Register the viewType for HtmlElementView
    // This registers the view for displaying the webcam in Flutter Web
    ui.platformViewRegistry.registerViewFactory('videoElement', (int viewId) {
      return _createVideoElement(); // Call method to create webcam element
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TrackFit'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            // Header Section
            const Text(
              'Elevate Your Workout!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Package Section
            const SizedBox(height: 20),
            const Text('Our Packages', style: TextStyle(fontSize: 22)),
            const SizedBox(height: 20),
            PackageCard(name: 'Basic Plan', price: '\$25'),
            PackageCard(name: 'Pro Plan', price: '\$55'),
            PackageCard(name: 'Advanced Plan', price: '\$75'),
            PackageCard(name: 'Premium Plan', price: '\$100'),

            // Footer Section
            const SizedBox(height: 20),
            const Text(
              'Subscribe to our fitness tips!',
              style: TextStyle(fontSize: 18),
            ),
            
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Start video playback when the button is pressed
                setState(() {
                  _controller.play(); // Now the play will work due to user interaction
                });
              },
              child: const Text('Get Started'),
            ),

            // Webcam Section
            const SizedBox(height: 30), // Space before the webcam section
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _webcamStarted = true; // Start webcam stream on button press
                });
              },
              child: const Text('Start Webcam'),
            ),
            const SizedBox(height: 20),

            // Video Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Webcam View
                Container(
                  width: 640,
                  height: 480,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                  ),
                  child: _webcamStarted
                      ? const HtmlElementView(viewType: 'videoElement') // Show webcam stream
                      : const Center(child: Text('Press Start Webcam')),
                ),
                
                // Video from Asset
                Container(
                  width: 640,
                  height: 480,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                  ),
                  child: _controller.value.isInitialized
                      ? Column(
                          children: [
                            AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            ),
                            const SizedBox(height: 10),
                            // Display loading percentage
                            LinearProgressIndicator(
                              value: _loadingPercentage / 100,
                              backgroundColor: Colors.grey,
                              color: Colors.green,
                            ),
                            const SizedBox(height: 5),
                            Text('${_loadingPercentage.toStringAsFixed(0)}% Loaded'), // Percentage Text
                          ],
                        )
                      : const Center(child: CircularProgressIndicator()), // Show loading indicator
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Method to create the webcam element
  html.VideoElement _createVideoElement() {
    final videoElement = html.VideoElement()
      ..width = 640
      ..height = 480
      ..autoplay = true;

    // Get the webcam stream
    html.window.navigator.mediaDevices?.getUserMedia({'video': true}).then((stream) {
      videoElement.srcObject = stream; // Assign webcam stream to video element
    });

    return videoElement; // Return the video element for use in HtmlElementView
  }
}

class PackageCard extends StatelessWidget {
  final String name;
  final String price;

  const PackageCard({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: const TextStyle(fontSize: 18, color: Colors.white)),
          Text(price, style: const TextStyle(fontSize: 16, color: Colors.white70)),
        ],
      ),
    );
  }
}
