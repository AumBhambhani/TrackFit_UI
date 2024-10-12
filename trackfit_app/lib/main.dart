import 'dart:html' as html; // For webcam access
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(TrackFitApp());
}

class TrackFitApp extends StatefulWidget {
  @override
  _TrackFitAppState createState() => _TrackFitAppState();
}

class _TrackFitAppState extends State<TrackFitApp> {
  late VideoPlayerController _controller;
  double _loadingPercentage = 0.0; // To track loading percentage

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
              onPressed: () {
                // Start video playback when the button is pressed
                setState(() {
                  _controller.play(); // Now the play will work due to user interaction
                });
              },
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

            // Video Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 640,
                  height: 480,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                  ),
                  child: HtmlElementView(viewType: 'videoElement'), // Embeds video stream
                ),
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
                            SizedBox(height: 10),
                            // Display loading percentage
                            LinearProgressIndicator(
                              value: _loadingPercentage / 100,
                              backgroundColor: Colors.grey,
                              color: Colors.green,
                            ),
                            SizedBox(height: 5),
                            Text('${_loadingPercentage.toStringAsFixed(0)}% Loaded'), // Percentage Text
                          ],
                        )
                      : Center(child: CircularProgressIndicator()), // Show loading indicator
                ),
              ],
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
