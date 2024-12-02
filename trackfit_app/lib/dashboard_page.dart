import 'package:flutter/material.dart';
import 'app_page.dart'; // Ensure the path is correct for your AppPage

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Dashboard'),
        elevation: 0,
      ),
      body: SingleChildScrollView( // Wrap with SingleChildScrollView to avoid overflow issues
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            const Text(
              'Your Progress',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            const SizedBox(height: 20),

            // Table-like structure for user's progress and stats
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Table(
                  border: TableBorder.all(color: Colors.teal, width: 2),
                  children: const [
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Current Weight', style: TextStyle(fontSize: 18)),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('70 kg', style: TextStyle(fontSize: 18)),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Height', style: TextStyle(fontSize: 18)),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('180 cm', style: TextStyle(fontSize: 18)),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Training Time', style: TextStyle(fontSize: 18)),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('2 hours', style: TextStyle(fontSize: 18)),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Activity Time', style: TextStyle(fontSize: 18)),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('1.5 hours', style: TextStyle(fontSize: 18)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Weight History Section
            const Text(
              'Weight History',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Table(
                  border: TableBorder.all(color: Colors.teal, width: 2),
                  children: const [
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Date', style: TextStyle(fontSize: 18)),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Weight', style: TextStyle(fontSize: 18)),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('2 weeks ago', style: TextStyle(fontSize: 18)),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('68 kg', style: TextStyle(fontSize: 18)),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('1 week ago', style: TextStyle(fontSize: 18)),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('69 kg', style: TextStyle(fontSize: 18)),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Today', style: TextStyle(fontSize: 18)),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('70 kg', style: TextStyle(fontSize: 18)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Workout History Section
            const Text(
              'Workout History',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Table(
                  border: TableBorder.all(color: Colors.teal, width: 2),
                  children: const [
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Workout Type', style: TextStyle(fontSize: 18)),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Duration', style: TextStyle(fontSize: 18)),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Cardio', style: TextStyle(fontSize: 18)),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('1 hour', style: TextStyle(fontSize: 18)),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Strength Training', style: TextStyle(fontSize: 18)),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('45 min', style: TextStyle(fontSize: 18)),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Yoga', style: TextStyle(fontSize: 18)),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('30 min', style: TextStyle(fontSize: 18)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Button to navigate to App Page
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Corrected button color parameter
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AppPage()),
                  );
                },
                child: const Text('Go to App Page'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
