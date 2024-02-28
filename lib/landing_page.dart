import 'package:flutter/material.dart';
import 'package:schedule_booking/reservation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clickable Images',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageClickablePage(),
    );
  }
}

class ImageClickablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Back arrow button
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        titleSpacing: 0, // No space between back arrow and title
        title: Text(''), // Empty title
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Center(
              child: Text(
                'Schedule a Ride', // Centered Schedule a Ride text
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          // Group 1 - Ride Now
          GestureDetector(
            onTap: () {
              // Navigation to AnotherPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookingScreen()),
              );
            },
            child: Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue, // Blue background
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/rush.png", // Image asset path
                    height: 50,
                    width: 50,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Ride Now', // Text below the blue box
                    style: TextStyle(
                      color: Colors.white, // White text color
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          // Group 2 - Ride Now
          GestureDetector(
            onTap: () {
              // Navigation to AnotherPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AnotherPage()),
              );
            },
            child: Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue, // Blue background
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/rush.png", // Image asset path
                    height: 50,
                    width: 50,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Ride Now!', // Text below the blue box
                    style: TextStyle(
                      color: Colors.white, // White text color
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          // Group 3 - Advance Booking
          GestureDetector(
            onTap: () {
              // Navigation to AnotherPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookingScreen()),
              );
            },
            child: Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue, // Blue background
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/rush.png", // Image asset path
                    height: 50,
                    width: 50,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Advance Booking', // Text below the blue box
                    style: TextStyle(
                      color: Colors.white, // White text color
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          // Group 4 - Scheduled Service
          GestureDetector(
            onTap: () {
              // Navigation to AnotherPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AnotherPage()),
              );
            },
            child: Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue, // Blue background
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/rush.png", // Image asset path
                    height: 50,
                    width: 50,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Scheduled Service', // Text below the blue box
                    style: TextStyle(
                      color: Colors.white, // White text color
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnotherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Another Page'),
      ),
      body: Center(
        child: Text('This is another page!'),
      ),
    );
  }
}
